#!/bin/bash
if [ $# == 0 ]
then
    echo " too few arguments"
    exit 1
fi
if [[ ! -f "$1" ]]
then
    echo "$1 file invalid"
    exit 1
fi
info=$( file "$1" )
s_info=$(sed s/[^:]*:// <<< $info)
grep -E "zip|archive|compress" <<< $s_info
if [ $? -ne 0 ]
then
    echo "$1 is not compressed file :("
    exit 1
fi

case "$1" in
    *.tar)tar xvf "$1"
    ;;
    *.tar.gz)tar xvzf "$1"     
    ;;
    *.tar.bz2)tar xvjf "$1"     
    ;;
    *.bz2)bunzip2 "$1"      
    ;;
    *.zip)unzip "$1"        
    ;;
    *.tgz)tar xvzf "$1"     
    ;;
    *.gz)gunzip "$1"       
    ;;
    *.tar.xz)tar xf "$1"		 
    ;;
    *.xz)tar xvfJ "$1"	 
    ;;
    *)echo "file format not supported" ;;
esac
