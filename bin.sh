#! /bin/sh
if which oclint 2>/dev/null; then
    echo 'oclint exist'
else
    brew tap oclint/formulae
    brew install oclint
fi
if which xcpretty 2>/dev/null; then
    echo 'xcpretty exist'
else
    gem install xcpretty
fi
cd test
xcodebuild clean
xcodebuild | xcpretty -r json-compilation-database
cp build/reports/compilation_db.json compile_commands.json
oclint-json-compilation-database -e Pods   -- -rc=LONG_LINE=200 -rc=NCSS_METHOD=100  -o=report.html