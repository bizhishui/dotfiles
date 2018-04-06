#!/bin/bash

echo "Need tow paras."
echo "\$1=S[simple]SS[très simple]|F[ull]"
echo "\$2 specify the remote path where files to be transferred."
echo "  "
echo "  "

if [ $# -lt 2  ]; then
    echo "The number of parameters is not correct..."
    exit 1
fi

if [ "$1" = "S" ]; then
    echo "Do not copy *.ser files"
    rsync -ravh -e ssh --include='*.vtk' --include='*.txt' --exclude='*.ser' jlv@login.ccamu.u-3mrs.fr:$2 .
#    rsync -ravh --progress -e ssh --include='*.vtk' --include='*.txt' --exclude='*.ser' jlv@login.ccamu.u-3mrs.fr:$2 .
elif [ "$1" = "SS" ]; then
    echo "Only copy txt files"
    rsync -ravh -e ssh --exclude='*.vtk' --include='*.txt' --exclude='*.ser' --exclude='*.jar' jlv@login.ccamu.u-3mrs.fr:$2 .
#    rsync -ravh --progress -e ssh --exclude='*.vtk' --include='*.txt' --exclude='*.ser' --exclude='*.jar' jlv@login.ccamu.u-3mrs.fr:$2 .
elif [ "$1" = "F" ]; then
    echo "Copy *.ser files"
    rsync -ravh --progress -e ssh --include='*.vtk' --include='*.txt' --include='*.ser' jlv@login.ccamu.u-3mrs.fr:$2 .
else
    echo "Parameter error."
    exit 1
fi
