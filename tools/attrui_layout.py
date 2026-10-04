"""Lay out every attrui column, and route its cords as one segmented cord.

ROWS. A column of attrui is one control surface, so its rows sit 1px apart —
a hairline, enough that two rows do not fuse into one shape and far too little
to read as a gap. Real space belongs BETWEEN groups, where it marks a boundary,
and a comment in the column is what names each group. So the column is walked
in order: a comment opens a new block, the attrui under it stack 1px apart, and
the next comment starts the next block.

Laying the whole column out from its own first y makes this idempotent and
independent of whatever spacing it had before — which matters, because a pass
that only closes gaps cannot tell a header's space from a row's once some
earlier pass has already closed both.

CORDS. Each cord leaves its outlet straight up or straight down to a shared
height, turns once, runs straight horizontal to a point directly above the
destination inlet, and drops in. A column shares one x, so every vertical stub
lies on one line and every horizontal run on another: N cords draw as one
segmented cord with the controls hanging off it.

    python3 tools/attrui_layout.py <patch.maxpat> [...]
    python3 tools/attrui_layout.py --messages <patch.maxpat> [...]

--messages treats a column of message boxes the same way: stacked 1px apart
and routed as one segmented cord into what they feed — typically a single
[s NAME] under the column, instead of one sender per message (John,
2026-09-24: "don't duplicate sends").

ROWS. Related short boxes can sit side by side — first / next / prev / last —
with a few pixels between them. A row moves with its leftmost box when a column
is stacked, and gets a small gap under it. Each of its cords drops into that
gap, runs left along it to the column's line, and goes down with the column's
own cords, so nothing is drawn across the rows below. A row on its own drops
straight to the run above its destination.
"""
import sys, json, collections

CLASSES = {'attrui'}

ROW_GAP = 1          # between stacked rows — a hairline, not a separator
HEAD_GAP = 6         # between a group's comment and its first row
BLOCK_GAP = 14       # between one group and the next
PORT_INSET = 9.5     # a box's first port's centre, from its left edge (Max 9's saved cords; rules._PORT_INSET_PX)
CLEARANCE = 12       # how far above the destination the horizontal run sits
ROW_REACH = 12       # the widest space between two boxes of one row
COLUMN_BREAK = 60    # a bigger vertical space than this ends a column
UNDER_ROW = 7        # the space under a row, where its cords run to the column
HEAD_INDENT = 12     # a heading between rows is set in this far, clear of the column's line
ALIGNED = 1          # a line this close to the inlet's x is over it: no bend at the bottom


def _feeds(P, bid):
    """The destinations a box's outlet 0 is cabled to."""
    return {tuple(l['patchline']['destination']) for l in P.get('lines', [])
            if l['patchline']['source'] == [bid, 0]}


def _rows(P, boxes):
    """Rows of CLASSES boxes: same y, side by side, all feeding the same place.
    Returns {leader id: [mate boxes]}."""
    byy = collections.defaultdict(list)
    for b in boxes.values():
        if b.get('maxclass') in CLASSES:
            byy[round(b['patching_rect'][1])].append(b)
    rows = {}
    for bs in byy.values():
        bs.sort(key=lambda b: b['patching_rect'][0])
        run = [bs[0]]
        for b in bs[1:] + [None]:
            prev = run[-1]
            if (b is not None
                    and b['patching_rect'][0] - (prev['patching_rect'][0] + prev['patching_rect'][2]) <= ROW_REACH
                    and _feeds(P, b['id']) and _feeds(P, b['id']) == _feeds(P, prev['id'])):
                run.append(b)
                continue
            if len(run) > 1:
                rows[run[0]['id']] = run[1:]
            run = [b]
    return rows


def _overlaps(P):
    """How many pairs of boxes in this scope overlap."""
    bs = [x['box'] for x in P['boxes']]
    n = 0
    for i, x in enumerate(bs):
        for y in bs[i + 1:]:
            a, c = x.get('patching_rect'), y.get('patching_rect')
            if not a or not c or a[2] <= 0 or c[2] <= 0:
                continue
            if (min(a[0] + a[2], c[0] + c[2]) - max(a[0], c[0]) > 0
                    and min(a[1] + a[3], c[1] + c[3]) - max(a[1], c[1]) > 0):
                n += 1
    return n


def lay_out(P, name, report):
    boxes = {x['box']['id']: x['box'] for x in P['boxes']}
    # Group by x ALONE. Grouping by (x, width) splits a column whose rows are
    # not all the same width and then stacks each width from its own top, which
    # lands them on each other.
    rows = _rows(P, boxes)
    mates = {m['id'] for ms in rows.values() for m in ms}
    # Boxes that share an x but sit far apart are not one column: a readout
    # 500 px under a column of controls must not be pulled up into it. So a
    # column is a run of boxes at one x with no big space between them, and
    # is keyed by (x, top) so two runs at one x stay apart.
    byx = collections.defaultdict(list)
    for b in boxes.values():
        if b.get('maxclass') in CLASSES and b['id'] not in mates:
            byx[round(b['patching_rect'][0])].append(b)
    cols = {}
    for x, bs in byx.items():
        bs.sort(key=lambda b: b['patching_rect'][1])
        run = [bs[0]]
        for b in bs[1:] + [None]:
            if b is not None and b['patching_rect'][1] - (run[-1]['patching_rect'][1] + run[-1]['patching_rect'][3]) <= COLUMN_BREAK:
                run.append(b); continue
            cols[(x, run[0]['patching_rect'][1])] = run
            run = [b]

    # A patch can place attrui in a CASCADE — each one indented from the last,
    # beside the example it belongs to — and that is not a column. The tell is
    # that two candidate columns overlap each other horizontally, which a real
    # pair of columns never does. Stacking a cascade lands its rows on each
    # other, so both are left alone.
    # Only real columns (two or more boxes) count: one wide box that happens
    # to span a column's x is not a second column.
    # Two columns that overlap sideways but sit one above the other are just
    # two columns, so the cascade test needs overlap in both directions.
    spans = {k: (k[0], k[0] + max(b['patching_rect'][2] for b in its),
                  min(b['patching_rect'][1] for b in its),
                  max(b['patching_rect'][1] + b['patching_rect'][3] for b in its))
             for k, its in cols.items() if len(its) > 1}
    cascading = {a for a in spans for b in spans
                 if a != b and spans[a][0] < spans[b][1] and spans[b][0] < spans[a][1]
                 and spans[a][2] < spans[b][3] and spans[b][2] < spans[a][3]}

    moved = routed = 0
    moved_at_entry = 0
    for key, items in cols.items():
        cx = key[0]
        if len(items) < 2 or key in cascading:
            continue
        # The column is the attrui at this x plus any comment sitting among
        # them — those are the group headers.
        lo = min(b['patching_rect'][1] for b in items)
        hi = max(b['patching_rect'][1] for b in items)
        column = items + [b for b in boxes.values()
                          if round(b['patching_rect'][0]) == cx and b.get('maxclass') == 'comment'
                          and lo - 40 <= b['patching_rect'][1] <= hi]
        column.sort(key=lambda b: b['patching_rect'][1])

        # Tidying is never worth breaking a patch for, so the result is
        # checked: if this column's new positions land on anything, the
        # column is put back exactly as it was. A layout that is not a
        # stacked column — a cascade, an arrangement beside examples — fails
        # that check and is left alone without needing to be recognised first.
        riders = [m for b in column for m in rows.get(b['id'], [])]
        snapshot = {id(b): list(b['patching_rect']) for b in column + riders}
        before = _overlaps(P)

        y = column[0]['patching_rect'][1]
        first = True
        for b in column:
            r = b['patching_rect']
            if b.get('maxclass') == 'comment':
                if not first:
                    y += BLOCK_GAP
                if r[1] != y:
                    r[1] = y; moved += 1
                # A heading inside the column is crossed by the column's own
                # line, which runs down the left edge at its outlets; set it in
                # so the line passes beside the words, not through them.
                if not first and r[0] < cx + HEAD_INDENT:
                    r[0] = cx + HEAD_INDENT; moved += 1
                y += r[3] + HEAD_GAP
            else:
                if r[1] != y:
                    for m in rows.get(b['id'], []):     # the row rides along
                        m['patching_rect'][1] = y
                    r[1] = y; moved += 1
                y += r[3] + (UNDER_ROW if rows.get(b['id']) else ROW_GAP)
            first = False

        if _overlaps(P) > before:
            for b in column + riders:
                b['patching_rect'] = snapshot[id(b)]
            moved = moved_at_entry
            report.append(f"    {name}: column at x={cx} left alone — tidying it would collide")
            continue
        moved_at_entry = moved

        joins = {m['id']: (b['patching_rect'][1] + b['patching_rect'][3] + UNDER_ROW / 2, cx + PORT_INSET)
                 for b in column for m in rows.get(b['id'], [])}
        routed += _route(P, boxes, {b['id'] for b in items} | set(joins), joins)
    # Rows that are not part of any column still route as one cord.
    in_cols = {b['id'] for its in cols.values() if len(its) > 1 for b in its}
    for lead, ms in rows.items():
        if lead not in in_cols:
            routed += _route(P, boxes, {lead} | {m['id'] for m in ms})
    if moved or routed:
        report.append(f"    {name}: {moved} moved, {routed} cords")
    return moved + routed


def _route(P, boxes, ids, joins=None):
    """Give every cord from these boxes to a shared destination the same run:
    straight down from its own outlet, across, and down into the inlet.
    joins: box id -> (y, x) of the gap a row's cord runs along to reach the
    column's line before it goes down."""
    joins = joins or {}
    routed = 0
    bydest = collections.defaultdict(list)
    for l in P.get('lines', []):
        pl = l['patchline']
        if pl['source'][0] in ids:
            bydest[tuple(pl['destination'])].append(pl)
    for (did, _inlet), pls in bydest.items():
        d = boxes.get(did)
        if not d or len(pls) < 2:
            continue
        dr = d['patching_rect']
        runY = dr[1] - CLEARANCE
        inX = dr[0] + PORT_INSET
        for pl in pls:
            sid = pl['source'][0]
            outX = boxes[sid]['patching_rect'][0] + PORT_INSET
            if sid in joins:
                gy, gx = joins[sid]
                if abs(gx - inX) <= ALIGNED:
                    # the column's line is over the inlet: join it and go
                    # straight down, with no bend at the bottom (John, 2026-10-03)
                    pl['midpoints'] = [outX, gy, inX, gy]
                else:
                    pl['midpoints'] = [outX, gy, gx, gy, gx, runY, inX, runY]
            elif abs(outX - inX) <= ALIGNED:
                pl['midpoints'] = []            # directly above the inlet: a straight cord
            else:
                pl['midpoints'] = [outX, runY, inX, runY]
            routed += 1
    return routed


args = sys.argv[1:]
if '--messages' in args:
    CLASSES.add('message')
    args = [a for a in args if a != '--messages']
for f in args:
    d = json.load(open(f))
    report, total = [], 0

    def walk(P, name):
        global total
        total += lay_out(P, name, report)
        for b in P.get('boxes', []):
            if 'patcher' in b['box']:
                walk(b['box']['patcher'], b['box'].get('text') or '?')

    walk(d['patcher'], 'root')
    print(f"  {f.split('/')[-1]}")
    for r in report:
        print(r)
    if total:
        json.dump(d, open(f, 'w'), indent=2)
