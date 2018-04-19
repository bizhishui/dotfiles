#!/bin/bash

echo "Need tow paras."
echo "\$1=u|d for upload|download"
echo "\$2 specify the files to be transferred."
echo "\$3 the adress"
echo "  "
echo "  "
if [ "$1" = "u" ]; then
    if [ $# -ne 2  ]; then 
        scp -P 2222 $2 jlyu@127.0.0.1:/users/rech/jlyu/CellInTube/
    else
       scp -P 2222 $2 jlyu@127.0.0.1:$3
    fi
    echo "upload cprrect"
elif [ "$1" = "d" ]; then
    scp -P 2222 jlyu@127.0.0.1:$2 $3
    echo "download cprrect"
else
    echo "Parameter error."
    exit 1
fi
