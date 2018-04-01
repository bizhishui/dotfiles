#!/bin/bash

echo "Need tow paras."
echo "\$1=u|d for upload|download"
echo "\$2 specify the files to be transferred."
echo "\$3 the adress"
echo "  "
echo "  "
if [ "$1" = "u" ]; then
    echo "upload cprrect"
    scp $2 jlv@login.ccamu.u-3mrs.fr:$3
elif [ "$1" = "d" ]; then
    echo "download cprrect"
    scp jlv@login.ccamu.u-3mrs.fr:$2 $3
else
    echo "Parameter error."
    exit 1
fi
