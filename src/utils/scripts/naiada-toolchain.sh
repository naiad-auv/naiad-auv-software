#!/bin/bash

out_obj_dir="../debug/obj/"
out_src_dir="../debug/src/"
in_src_dir="../src/"

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

../compiler/naiada -vg "$out_src_dir$Program"

if [[ $? == 0 ]]
then
  echo -e "PRI converted into NMC successfully\n"
  mv "$out_src_dir$Program.nmc" $out_obj_dir
  mv -f ./regenerated_code.nai $out_src_dir
else
  echo -e "\nFailed to convert PRI to NMC!"
  exit
fi

# NMC to Byte-code
echo "Converting NMC to Byte-code"

../bytecode_converter/obj/main "$out_obj_dir$(echo $Program).nmc" "$out_obj_dir$(echo $Program).nmc.byte"

if [[ $? == 0 ]]
then
  echo -e "NMC converted into Byte-code successfully\n";
else
  echo -e "\nFailed to create Byte-code!"
  exit
fi

