#!/bin/bash

echo "Need tow paras."
echo "\$1=u|d for upload|download"
echo "\$2 specify the files to be transferred."
echo "\$3 the adress"
echo "  "
echo "  "
if [ "$1" = "u" ]; then
    scp $2 chen@duke.l3m.univ-mrs.fr:$3
    echo "upload cprrect"
elif [ "$1" = "d" ]; then
    scp chen@duke.l3m.univ-mrs.fr:$2 $3
    echo "download cprrect"
else
    echo "Parameter error."
    exit 1
fi
#scp chen@duke.l3m.univ-mrs.fr:$1/*vtk ./
#scp chen@duke.l3m.univ-mrs.fr:$1/*txt ./
