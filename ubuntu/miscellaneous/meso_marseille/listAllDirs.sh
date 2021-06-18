#!/bin/bash

#https://unix.stackexchange.com/questions/111949/get-list-of-subdirectories-which-contain-a-file-whose-name-contains-a-string
find . -type f -name 'GeometricParameters.txt' >> dirs.list
