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
    echo "Copy only *.txt files"
    rsync -rav -e ssh --include='*.vtk' --include='*.txt' --exclude='*.ser' --exclude='RUN*' --exclude='*.jar' jlv@login.ccamu.u-3mrs.fr:$2 .
else
    echo "Parameter error."
    exit 1
fi
