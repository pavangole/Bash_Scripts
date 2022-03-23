#!/bin/bash
echo -n "Enter folder name :- "
read filename
if [ -d $filename ]
then
    echo -e "File $filename already exits \n"
else
    mkdir $filename 
fi