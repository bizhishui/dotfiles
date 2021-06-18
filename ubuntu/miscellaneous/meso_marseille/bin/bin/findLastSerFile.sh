#!/bin/bash

outputFile=/scratch/jlv/CellInTube/Vesicle/Misbah2014_3/lastSerFile.list
if [ -f $outputFile ]; then
    rm $outputFile
fi
touch $outputFile

for D in *; do
    echo $D
    if [ -d "$D" ]; then
        cd $D
        #find . -name '*.ser' -type f -exec du {} \; | sort -n | awk 'END{$1=""; print}'
        printf $PWD >> $outputFile
        find . -name '*.ser' -type f -exec du {} \; | sort -n | awk -v outFile=$outputFile 'END{$1=""; print >> outFile}'
        cd -
    fi
done

sed -i 's/ /\//' $outputFile
