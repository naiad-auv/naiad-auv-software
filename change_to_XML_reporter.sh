#!/bin/bash

# 1. Search for all test_runner.adb files
# 2. Replace two lines in each file.
#    AUnit.Reporter.GNATtest.GNATtest_Reporter TO
#       AUnit.Reporter.XML.XML_Reporter AND
#    AUnit.Reporter.GNATtest TO
#       AUnit.Reporter.GNATtest

find ./tests -name test_runner.adb -type f \
    -exec sed -iBKP "s/AUnit.Reporter.GNATtest.GNATtest_Reporter/AUnit.Reporter.XML.XML_Reporter/g;s/AUnit.Reporter.GNATtest/AUnit.Reporter.XML/g;" \
    "{}" \;


# find . -name test_runner.adb | while read file; do
#
# done
