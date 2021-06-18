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
    rsync -ravh -e ssh --exclude='in' --exclude='out' --exclude='wall' --include='tube' --include='*.vtk' --include='*.txt' --exclude='*.ser' --exclude='RUN*' dahu.ciment:$2 .
#    rsync -ravh --progress -e ssh --include='*.vtk' --include='*.txt' --exclude='*.ser' jlv@login.mesocentre.univ-amu.fr:$2 .
elif [ "$1" = "SS" ]; then
    echo "Only copy txt files"
    rsync -ravh -e ssh  --exclude='in' --exclude='wall' --exclude='out' --exclude='*.vtk' --include='*.txt' --exclude='*.ser' --exclude='*.jar' --exclude='RUN*' dahu.ciment:$2 .
#    rsync -ravh --progress -e ssh --exclude='*.vtk' --include='*.txt' --exclude='*.ser' --exclude='*.jar' jlv@login.mesocentre.univ-amu.fr:$2 .
elif [ "$1" = "F" ]; then
    echo "Copy *.ser files"
    rsync -ravh -e ssh --include='*.vtk' --include='*.txt' --include='*.ser' --exclude='in' --exclude='wall' --exclude='out' --exclude='RUN*' dahu.ciment:$2 .
else
    echo "Parameter error."
    exit 1
fi
