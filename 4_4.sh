#!/bin/bash

dest=$1
if [ ! -d "$dest" ]
then
    echo "Destination directory not exist :("
    exit 1
fi

if [ $# -lt 2 ]
then
    echo "Too few arguments :("
    exit 1
fi

if [ "$2" = "all" ]
then
    for file in $dest/*
    do
        if [[ ! -f $file ]]
        then
            continue
        fi
        f_f_name=$(sed 's/ /?/g' <<< $file)
        base=$(basename "$f_f_name")
        ext="${base##*.}"
        if [ $ext == $base ]
        then
            continue
        fi
        if [ -d $dest/$ext ]
        then 
            mv -i "$file" $dest/$ext
        else    
            mkdir $dest/$ext
            mv -i "$file" $dest/$ext
        fi
    done
else    
    extarr=$@
    l=${#dest}
    extarr=${extarr:l+1}
    for file in $dest/*
    do
        if [[ ! -f $file ]]
        then
            continue
        fi
        f_f_name=$(sed 's/ /?/g' <<< $file)
        base=$(basename "$f_f_name")
        ext="${base##*.}"
        if [ $ext == $base ]
        then
            continue
        fi
        grep -q "$ext" <<< "$extarr"
        if [ $? -ne 0 ]
        then 
            continue
        fi
        if [ -d $dest/$ext ]
        then 
            mv -i "$file" $dest/$ext
        else    
            mkdir $dest/$ext
            mv -i "$file" $dest/$ext
        fi
    done
fi
