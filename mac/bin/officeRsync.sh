#!/bin/bash

echo "Need tow paras."
echo "\$1=S[simple]"
echo "\$2 specify the remote path where files to be transferred."
echo "  "
echo "  "

if [ $# -ne 2  ]; then
    echo "The number of parameters is not correct..."
    exit 1
fi

if [ "$1" = "S" ]; then
    echo "Do not copy *.ser files"
    rsync -rav -e ssh --include='*.vtk' --include='*.txt' --include='*.ser' --exclude='*.jar' --exclude='RUN*' jinming@195.83.116.110:$2 .
else
    echo "Parameter error."
    exit 1
fi
