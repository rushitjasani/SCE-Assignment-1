#!/bin/bash

awk '
    {
        if(map[$0]==0){
            print $0;
            map[$0] = 1; 
        }
    }
'