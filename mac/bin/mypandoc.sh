#!/bin/bash

if [ $# -eq 1 ]; then
    pandoc --template=$HOME/Templates/template.tex --latex-engine=xelatex -s $1.md -o $1.pdf
else
    echo "This script can only accept one parameter"
    exit 1
fi
