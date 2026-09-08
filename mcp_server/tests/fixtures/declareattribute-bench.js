inlets = 1; outlets = 2;
setinletassist(0, "pitch/velocity list");
setoutletassist(0, "flush");
declareattribute("slidermode", {type: "long", min: 0, max: 1, style: "onoff", label: "Slider Mode (per key)"});
declareattribute("displaymode", {type: "long", min: 0, max: 1, label: "Per-key Display Mode"});
declareattribute("keycolor", {type: "float32", size: 4, default: [0.2, 0.2, 0.2, 1.0], label: "Keycolor"});
declareattribute("mode", {type: "symbol", enumvals: ["a", "b"], style: "enum", label: "Mode"});
declareattribute("legacy", "getlegacy", "setlegacy");
