#!/bin/bash

if [ $# -ne 1 ];
then
    echo "Usage: ./translator.sh input 1> output"
    exit
fi

cat $1  | sed ':a;N;s/)[ ]*\n[ ]*\"/) \"/;ba' \
        | sed 's/DISPLAY[ ]*([ ]*[0-9]*[ ]* \([0-9]*\)[ ]*)[ ]*\([^\.\n]*\)/DISPLAY \2 AT COLUMN NUMBER \1/' \
        | sed 's/ACCEPT[ ]*([ ]*[0-9]*[ ]* \([0-9]*\)[ ]*)[ ]*\([^\.\n]*\)/ACCEPT \2 AT COLUMN NUMBER \1/' \
        | sed -e '/.\{72\}/s/\([^A]*\)\(AT COLUMN.*\)/\1\n             \2/'
exit
