#!/bin/bash
r=$( tput lines )
midx=$((r / 2))
c=$( tput cols )
midy=$((c / 2))
declare -A mat
for ((i=0;i<r;i++)) 
do
    for ((j=0;j<c;j++)) 
    do
        mat[$i,$j]=0
    done
done
x=$midx
y=$midy
d=6
col=$(($RANDOM % 7 ))
tput clear
tput cup $x $y
# tput setab 7
tput clear 
while [ 1 -eq 1 ]
do
    read -n1 -t 1 -rs one
    if [[ "$one" == $'\x1b' ]]
    then
        read -n1 -t 0.01 -rs sb
        if [[ "$sb" == "[" ]]
        then
            read -n1 -t 0.01 -rs move
            pdir=$d
            case "$move" in
                "A")d=8;;
                "B")d=2;;
                "C")d=6;;
                "D")d=4;;
                * );;
            esac
            if [ $pdir -ne $d ]
            then
                col=$(($RANDOM % 7 ))
            fi
        fi
    fi
    case $d in
                8)((x--));;
                2)((x++));;
                6)((y++));;
                4)((y--));;
                *);;
            esac
    if [ $x -ge $r ] || [ $x -le 0 ] || [ $y -ge $c ] || [ $y -le 0 ] || [ ${mat[$x,$y]} -eq 1 ]
    then
        tput clear
        x=$midx
        y=$midy
        d=6
        for ((i=0;i<r;i++)) 
        do
            for ((j=0;j<c;j++)) 
            do
                mat[$i,$j]=0
            done
        done
    fi
    mat[$x,$y]=1
    tput cup $x $y
    tput setaf $col
    echo -e "*\c" 
    tput cup $x $y
done