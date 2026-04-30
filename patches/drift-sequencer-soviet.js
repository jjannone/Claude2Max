// Soviet Constructivist theme overlay — red wedges + paper grain
// Full-presentation jsui: ignoreclick=1, transparent background
autowatch = 1;
inlets = 1;
outlets = 0;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var WEDGE_W = 18;
var WEDGE_H = 22;
var WEDGE_X = 10;

// Y positions for red wedge section markers
var WEDGE_Y = [8, 96, 228];

function paint() {
    var w = mgraphics.size[0];
    var h = mgraphics.size[1];

    // Paper grain — subtle horizontal hairlines
    mgraphics.set_source_rgba(0, 0, 0, 0.018);
    for (var y = 0; y < h; y += 3) {
        mgraphics.rectangle(0, y, w, 1);
        mgraphics.fill();
    }

    // Red wedges (right-pointing triangles)
    mgraphics.set_source_rgba(0.8, 0.122, 0.102, 1.0);
    for (var i = 0; i < WEDGE_Y.length; i++) {
        var wy = WEDGE_Y[i];
        mgraphics.move_to(WEDGE_X, wy);
        mgraphics.line_to(WEDGE_X + WEDGE_W, wy + WEDGE_H / 2);
        mgraphics.line_to(WEDGE_X, wy + WEDGE_H);
        mgraphics.close_path();
        mgraphics.fill();
    }
}

function bang() {
    mgraphics.redraw();
}
