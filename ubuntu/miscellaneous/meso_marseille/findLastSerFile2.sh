#!/bin/bash

outputFile=`pwd`/test
if [ -f $outputFile ]; then
    rm $outputFile
fi
touch $outputFile

#function searchOneLevel {
#    oldDir2=`pwd`
#    echo $oldDir2
#    for D in *; do
#        if [ -d "$D" ]; then
#            echo $D
#            cd $D
#            find `pwd` -name '*.ser' -type f -exec du {} \; | sort -n | awk -v outFile=$outputFile 'END{$1=""; print >> outFile}'
#            cd $oldDir2
#        fi
#    done
#}
#
#oldDir=`pwd`
#echo $oldDir
#for D in *; do
#    #echo $D
#    if [ -d "$D" ]; then
#        echo $D
#        cd $D
#        searchOneLevel
#        cd $oldDir
#    fi
#done

for D in *; do
    if [ -d "$D" ]; then
        cd $D
        find `pwd` -name '*.ser' -type f -exec du {} \; | sort -n | awk -v outFile=$outputFile 'END{$1=""; print >> outFile}'
        cd -
    fi
done
