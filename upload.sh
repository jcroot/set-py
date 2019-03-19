#!/bin/bash

ENDVALUE=$1 
rm listado.txt
COUNTER=0

while [ $COUNTER -le $ENDVALUE ]; do
  wget "http://www.set.gov.py/rest/contents/download/collaboration/sites/PARAGUAY-SET/documents/informes-periodicos/ruc/ruc$COUNTER.zip"
  let COUNTER=COUNTER+1
done


for lst in `ls *.zip`; do
  unzip $lst
done

rm *.zip
rm *.zip*

for lst in `ls *.txt`; do
  cat $lst >> listado.txt
  rm $lst
done

node app.js
