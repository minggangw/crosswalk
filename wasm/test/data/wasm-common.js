function load(path) {}

var print = console.log.bind(console);

function assertTrue(cond) {
    document.title = cond ? "Pass" : "Fail";
}
function assertFalse(cond) {
    assertTrue(!cond);
}
function assertEquals(a, b) {
    assertTrue(a == b);
}
function assertThrows(func) {
    try {
        func();
        document.title = "Fail";
    } catch(e) {
        document.title = "Pass";
    }
}
