#!/usr/bin/env bash

# set working directory to script location
cd "$(dirname "$0")"

# get all files with no extension
shopt -s extglob
files=(!(*.*))

# compile fortune files
for file in "${files[@]}"
do
  echo; echo "compiling $file"
  rm -f ${file}.dat
  strfile -c % ${file} ${file}.dat
done

# move to sub directory
rm -rf compiled
mkdir -p compiled
mv *.dat ./compiled
