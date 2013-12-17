#!/bin/bash

# Check command format
if [[ "$#" -ne 1 ]]
then
  echo "Illegal number of parameters!"
  echo -e "\nUsage: ./naiada-toolchain path-to-xml-file\n"
  exit
fi

XML_file=$1

# XML to PRI
echo "Converting XML to PRI ..."
Program="$(python xml2pri.py $XML_file)"

if [[ "$Program" == *.pri* ]]
then
  echo -e "Primitive: $Program has been created\n";
else
  echo -e "\nFailed to create program!"
  exit
fi

# PRI to NMC
echo "Converting PRI to NMC ..."

if [[ $(../compiler/naiada $Program) == 0 ]]
then
  echo -e "PRI converted into NMC successfully\n"
else
  echo -e "\nFailed to convert PRI to NMC!"
  exit
fi

# NMC to Byte-code
echo "Converting NMC to Byte-code"

if [[ "$(../bytecode_converter/obj/main '$(echo $Program).nmc')" == *successfull* ]]
then
  echo -e "NMC converted into Byte-code successfully\n";
else
  echo -e "\nFailed to create Byte-code!"
  exit
fi

