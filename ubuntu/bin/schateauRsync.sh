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
    rsync -rav -e ssh --exclude='*.vtk' --include='*.txt' --exclude='*.ser' schateau@195.83.116.129:$2 .
elif [ "$1" = "F" ]; then
    echo "Copy *.ser files"
    rsync -rav -e ssh --include='*.vtk' --include='*.txt' --include='*.ser' schateau@195.83.116.129:$2 .
elif [ "$1" = "Ser" ]; then
    echo "only copy *.ser files"
    rsync -rav -e ssh --exclude='*.vtk' --exclude='*.jar' --exclude='RUN*' --include='*.txt' --include='*.ser' schateau@195.83.116.129:$2 .
else
    echo "Parameter error."
    exit 1
fi
