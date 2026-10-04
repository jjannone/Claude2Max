// Test for max-behavior-tests tab 2: can messnamed() reach a buffer~ by its name?
inlets = 1;
outlets = 1;
setinletassist(0, "bang: send setsize 2000 to BT_BUF with messnamed()");
setoutletassist(0, "bang after the message was sent");

function bang() {
	messnamed("BT_BUF", "setsize", 2000);
	outlet(0, "bang");
}
