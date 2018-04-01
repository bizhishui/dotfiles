#!/bin/bash

echo "Need tow paras."
echo "\$1=S[simple]|F[ull]"
echo "\$2 specify the remote path where files to be transferred."
echo "  "
echo "  "

if [ $# -ne 2  ]; then
    echo "The number of parameters is not correct..."
    exit 1
fi

if [ "$1" = "S" ]; then
    echo "Do not copy *.ser files"
    rsync -rav -e ssh --include='*.vtk' --include='*.txt' --exclude='*.ser' chen@duke.l3m.univ-mrs.fr:$2 .
elif [ "$1" = "F" ]; then
    echo "Copy *.ser files"
    rsync -rav -e ssh --include='*.vtk' --include='*.txt' --include='*.ser' chen@duke.l3m.univ-mrs.fr:$2 .
else
    echo "Parameter error."
    exit 1
fi
