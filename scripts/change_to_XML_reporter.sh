#!/bin/bash

# 1. Search for all test_runner.adb files
# 2. Replace two lines in each file.
#    AUnit.Reporter.GNATtest.GNATtest_Reporter TO
#    AUnit.Reporter.XML.XML_Reporter AND
#    AUnit.Reporter.GNATtest TO
#    AUnit.Reporter.XML

usage()
{
cat << EOF
usage: $0 -p PATH

OPTIONS:
    -p     PATH (to folder containing test_runner.adb)
EOF
}

##########################################
# Entry point for script
##########################################
GIVEN_PATH=

# Gathering input values. Some basics at the follwing page
# http://rsalveti.wordpress.com/2007/04/03/bash-parsing-arguments-with-getopts/
while getopts “hp:” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         p)
             GIVEN_PATH=$OPTARG
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

# Checking if the input values are set
if [[ -z $GIVEN_PATH ]]
then
     usage
     exit 1
fi

find $GIVEN_PATH -name test_runner.adb -type f \
    -exec sed -iBKP "s/AUnit.Reporter.GNATtest.GNATtest_Reporter/AUnit.Reporter.XML.XML_Reporter/g;s/AUnit.Reporter.GNATtest/AUnit.Reporter.XML/g;" \
    "{}" \;
