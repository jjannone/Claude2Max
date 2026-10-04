// Test for coll-table-messnamed: can messnamed() reach a coll or table by its name?
inlets = 2;
outlets = 1;
setinletassist(0, "bang: send store b js to BT_COLL with messnamed()");
setinletassist(1, "bang: send set 0 22 to BT_TABLE with messnamed()");
setoutletassist(0, "coll or table, after the message was sent");

function bang() {
	if (inlet === 0) {
		messnamed("BT_COLL", "store", "b", "js");
		outlet(0, "coll");
	} else {
		messnamed("BT_TABLE", "set", 0, 22);
		outlet(0, "table");
	}
}
