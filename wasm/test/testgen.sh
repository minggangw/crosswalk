#!/bin/bash

testdir="../../../v8/test/mjsunit/wasm"
blacklist="wasm-constants.js wasm-module-builder.js"

dir=${0%/*}
test "$dir" != "$0" && cd $dir
if test ! -d "$testdir"; then
    echo "Error: wasm directory not found"
    exit 1
fi

cp xwalk_wasm_unittest.in xwalk_wasm_unittest.cc
for jsfile in $testdir/*.js; do
    basename=${jsfile##*/}
    test "${blacklist%$basename*}" != "${blacklist}" && continue
    testname=${basename%.js}
    htmlfile=$testname.html
    while test "${testname%-*}" != "$testname"; do
        testname=${testname%%-*}${testname#*-}
    done

    echo "
IN_PROC_BROWSER_TEST_F(XWalkWasmTest, $testname) {
    string16 result = RunTestFile(FILE_PATH_LITERAL(\"$htmlfile\"));
    EXPECT_EQ(kPass, result);
}" >> xwalk_wasm_unittest.cc

    echo "
<html>
<head>
    <script type='text/javascript' src='wasm-common.js'></script>
    <script type='text/javascript' src='../$testdir/wasm-constants.js'></script>
    <script type='text/javascript' src='../$testdir/wasm-module-builder.js'></script>
    <script type='text/javascript' src='../$jsfile'></script>
</head>
<body>
</body>
</html>" > data/$htmlfile
done
