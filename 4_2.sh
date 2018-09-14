#!/bin/bash
flag=0
read -sp "Enter Password: "  Password
length=${#Password}
if [ $length -gt 7 ]
then 
    if [[ "$Password" == *[0-9]* ]]
    then 
        if [[ "$Password" == *[\#$%\&@*+-=]* ]]
        then
            echo "Strong Password :)"
            flag=1
        fi
    fi
fi
if [ $flag -eq 0 ]
then
    echo "Weak Password :("
fi
