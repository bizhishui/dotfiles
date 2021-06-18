#!/bin/bash

# find $2 in $1, if found
# duplicate it, and replace $2 with $3 in the new line

#sed -i '/Bihar/p 
#    s/^Bihar/Beihai/' $1

if [ $# != 3 ]; then 
  echo "You should give me three parameters"
  echo "#1 the file to be treated"
  echo "#2 the original word to be replaced"
  echo "#3 the new word"
  exit 1
fi

sed -i "/$2/p 
    s/$2/$3/" $1
