#!/bin/bash

ADMIN="rgjoshi24@gmail.com"
THRESHOLD=75

function disk_usage() {
while read output;
do
        echo $output
        usep=$(echo $output|awk '{print $1}'|cut -d'%' -f1)
        echo $usep
        partition=$(echo $output|awk '{print $2}')
        echo $partition
        if [ $usep -ge $THRESHOLD ] ; then
                echo "The partition $partition usage has grown beyond $THRESHOLD: $usep "
                mail -s "The partition $partition usage has grown beyond $THRESHOLD: $usep" $ADMIN
        else
                echo "The partition $partition is withing the $THRESHOLD: $usep"
        fi
done

}

df -H|grep -vE "^Filesystem|tmpfs|cdrom"|awk '{print $5" "$6i}'|disk_usage
