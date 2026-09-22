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
"""
import sys, json, collections

ROW_GAP = 1          # between stacked rows — a hairline, not a separator
HEAD_GAP = 6         # between a group's comment and its first row
BLOCK_GAP = 14       # between one group and the next
PORT_INSET = 3       # a box's first port sits this far in from its left edge
CLEARANCE = 12       # how far above the destination the horizontal run sits


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
    cols = collections.defaultdict(list)
    for b in boxes.values():
        if b.get('maxclass') == 'attrui':
            cols[round(b['patching_rect'][0])].append(b)

    # A patch can place attrui in a CASCADE — each one indented from the last,
    # beside the example it belongs to — and that is not a column. The tell is
    # that two candidate columns overlap each other horizontally, which a real
    # pair of columns never does. Stacking a cascade lands its rows on each
    # other, so both are left alone.
    spans = {cx: (cx, cx + max(b['patching_rect'][2] for b in its))
             for cx, its in cols.items()}
    cascading = {a for a in spans for b in spans
                 if a != b and spans[a][0] < spans[b][1] and spans[b][0] < spans[a][1]}

    moved = routed = 0
    moved_at_entry = 0
    for cx, items in cols.items():
        if len(items) < 2 or cx in cascading:
            continue
        # The column is the attrui at this x plus any comment sitting among
        # them — those are the group headers.
        lo = min(b['patching_rect'][1] for b in items)
        hi = max(b['patching_rect'][1] for b in items)
        column = [b for b in boxes.values()
                  if round(b['patching_rect'][0]) == cx
                  and (b.get('maxclass') == 'attrui'
                       or (b.get('maxclass') == 'comment'
                           and lo - 40 <= b['patching_rect'][1] <= hi))]
        column.sort(key=lambda b: b['patching_rect'][1])

        # Tidying is never worth breaking a patch for, so the result is
        # checked: if this column's new positions land on anything, the
        # column is put back exactly as it was. A layout that is not a
        # stacked column — a cascade, an arrangement beside examples — fails
        # that check and is left alone without needing to be recognised first.
        snapshot = {id(b): list(b['patching_rect']) for b in column}
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
                y += r[3] + HEAD_GAP
            else:
                if r[1] != y:
                    r[1] = y; moved += 1
                y += r[3] + ROW_GAP
            first = False

        if _overlaps(P) > before:
            for b in column:
                b['patching_rect'] = snapshot[id(b)]
            moved = moved_at_entry
            report.append(f"    {name}: column at x={cx} left alone — tidying it would collide")
            continue
        moved_at_entry = moved

        ids = {b['id'] for b in items}
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
            outX = cx + PORT_INSET
            for pl in pls:
                pl['midpoints'] = [outX, runY, inX, runY]
                routed += 1
    if moved or routed:
        report.append(f"    {name}: {moved} moved, {routed} cords")
    return moved + routed


for f in sys.argv[1:]:
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
