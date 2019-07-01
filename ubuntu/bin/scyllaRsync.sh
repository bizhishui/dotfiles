#!/bin/bash

echo "Need tow paras."
echo "\$1=S[simple]SS[très simple]|F[ull]"
echo "\$2 specify the remote path where files to be transferred."
echo "  "
echo "  "

# scp -P 2222 SoftTube_20180520.jar jlyu@127.0.0.1:/users/rech/jlyu/CellInTube

if [ $# -lt 2  ]; then
    echo "The number of parameters is not correct..."
    exit 1
fi

if [ "$1" = "S" ]; then
    echo "Do not copy *.ser files"
    rsync -ravh -e "ssh -p 2222" --include='*.vtk' --include='*.txt' --exclude='*.ser' jlyu@127.0.0.1:$2 .
#    rsync -ravh --progress -e ssh --include='*.vtk' --include='*.txt' --exclude='*.ser' jlyu@login.ccamu.u-3mrs.fr:$2 .
elif [ "$1" = "SS" ]; then
    echo "Only copy txt files"
    rsync -ravh -e "ssh -p 2222" --exclude='*.vtk' --include='*.txt' --exclude='*.ser' --exclude='*.jar' jlyu@127.0.0.1:$2 .
#    rsync -ravh --progress -e ssh --exclude='*.vtk' --include='*.txt' --exclude='*.ser' --exclude='*.jar' jlyu@login.ccamu.u-3mrs.fr:$2 .
elif [ "$1" = "F" ]; then
    echo "Copy *.ser files"
    rsync -ravh -e "ssh -p 2222" --include='*.vtk' --include='*.txt' --include='*.ser' jlyu@127.0.0.1:$2 .
else
    echo "Parameter error."
    exit 1
fi
