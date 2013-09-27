#!/bin/bash

# 1. Search for all test_runner.adb files
# 2. Replace two lines in each file.
#     AUnit.Reporter.XML.XML_Reporter TO
#     AUnit.Reporter.GNATtest.GNATtest_Reporter AND
#     AUnit.Reporter.XML TO
#     AUnit.Reporter.GNATtest

find ./tests -name test_runner.adb -type f \
    -exec sed -iBKP "s/AUnit.Reporter.XML.XML_Reporter/AUnit.Reporter.GNATtest.GNATtest_Reporter/g;s/AUnit.Reporter.XML/AUnit.Reporter.GNATtest/g;" \
    "{}" \;
