#!/bin/bash

echo "Need tow paras."
echo "\$1=u|d for upload|download"
echo "\$2 specify the files to be transferred."
echo "\$3 the adress"
echo "  "
echo "  "
if [ "$1" = "u" ]; then
    scp $2 jlv@login.ccamu.u-3mrs.fr:$3
    echo "upload correct"
elif [ "$1" = "d" ]; then
    scp jlv@login.ccamu.u-3mrs.fr:$2 $3
    echo "download correct"
else
    echo "Parameter error."
    exit 1
fi
