#!/usr/bin/bash

base=$(dirname $0);

testAbsolute=${base:0:1};

if [ $testAbsolute == "/" ]
then
  for file in $(find $base/* -xtype l -name '*.rslink'); do
    target=$(readlink -f $file);
    file2=${file:0:${#file}-7};
    echo "Creating missing symbolic link based on"
    echo "Reverse symbolic link: $file"
    echo "$target --> $file2";
    ln -s $file2 $target
    ls -lF --time-style=long-iso $target
  done
else
  echo "Use absolute path to run this program";
fi