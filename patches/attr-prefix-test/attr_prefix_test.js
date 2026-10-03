// attr_prefix_test.js — can ONE attribute appear in more than one Inspector
// group? v8.maxhelp documents `category` as a string, so there is no
// documented way; these rows try three undocumented ones:
//   both_array  category given as an array of two names
//   both_comma  category given as one string, the names joined by a comma
//   both_twice  declared twice, once per category (the second may throw)
// first_a / second_a are plain one-group rows, so each group has a known member.
// The box draws every value, so you can also see whether setting one from
// the Inspector reaches the script.

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

inlets = 1;
outlets = 1;
setinletassist(0, "bang: post every attribute's value to the Max console");
setoutletassist(0, "nothing (test object)");

var NAMES = ["first_a", "second_a", "both_array", "both_comma", "both_twice"];
var CATEGORY = {
    first_a:    "butter_first",
    second_a:   "butter_second",
    both_array: ["butter_first", "butter_second"],
    both_comma: "butter_first, butter_second",
    both_twice: "butter_first"
};
var VALS = {};
var OK = {};

// getter and setter take function NAMES (strings), per v8.maxhelp.
NAMES.forEach(function(name, i){
    VALS[name] = i;
    try {
        declareattribute(name, {
            type: "long", default: i, embed: 1,
            label: name + " (category: " + String(CATEGORY[name]) + ")",
            category: CATEGORY[name],
            getter: "get_" + i,
            setter: "set_" + i
        });
        OK[name] = true;
        post("attr_prefix_test: declared @" + name + "\n");
    } catch(e) {
        OK[name] = false;
        post("attr_prefix_test: could not declare @" + name + " (" + e + ")\n");
    }
});

// The second declaration of both_twice, in the other group.
try {
    declareattribute("both_twice", {
        type: "long", default: 4, embed: 1,
        label: "both_twice (category: butter_second, second declaration)",
        category: "butter_second", getter: "get_4", setter: "set_4"
    });
    post("attr_prefix_test: declared @both_twice a second time\n");
} catch(e) {
    post("attr_prefix_test: second declaration of @both_twice refused (" + e + ")\n");
}

function getv(i){ return VALS[NAMES[i]]; }
function setv(i, v){ VALS[NAMES[i]] = v; mgraphics.redraw(); }
function get_0(){ return getv(0); }  function set_0(v){ setv(0, v); }
function get_1(){ return getv(1); }  function set_1(v){ setv(1, v); }
function get_2(){ return getv(2); }  function set_2(v){ setv(2, v); }
function get_3(){ return getv(3); }  function set_3(v){ setv(3, v); }
function get_4(){ return getv(4); }  function set_4(v){ setv(4, v); }

function bang(){
    NAMES.forEach(function(n){ post("@" + n + " = " + VALS[n] + (OK[n] ? "" : "  (not declared)") + "\n"); });
}

function paint(){
    var sz = mgraphics.size;
    mgraphics.set_source_rgba(0.15, 0.15, 0.15, 1);
    mgraphics.rectangle(0, 0, sz[0], sz[1]); mgraphics.fill();
    mgraphics.set_font_size(12);
    NAMES.forEach(function(n, i){
        mgraphics.set_source_rgba(OK[n] ? [0.9, 0.9, 0.9, 1] : [1, 0.4, 0.4, 1]);
        mgraphics.move_to(8, 18 + i * 18);
        mgraphics.show_text(n + " = " + VALS[n] + "  (" + String(CATEGORY[n]) + ")" + (OK[n] ? "" : "  failed"));
    });
}
