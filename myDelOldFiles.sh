#!/bin/bash

Folder=$1
NDays=$2

#Check for the parameters
if [ "$Folder" == "" ] || [ "$NDays" == "" ]
then
        echo "Either one of the parameter is blank"
        echo "Usage is: $0 folder NoOfDays"
        exit 1
fi

if [ ! -d $Folder ]
then
        echo "$Folder is not a folder"
        echo "Usage is: $0 folder NoOfDays"
        exit 2
fi

find $FOLDER/* -mtime +$N_DAYS -exec rm {} \;
