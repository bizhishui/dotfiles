#!/bin/bash

for s in $@; do
	#extract line contain simualtion path
	line4=`sed '4q;d' $s`
	#splite line by " ', get pure path from the last element
	path=$(echo $line4 | awk -F" " '{print $NF}')
	#echo ${path}
	#get both log and err files
	files=${s/out/*}
	#echo $files
	mv $files $path
done
