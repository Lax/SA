#!/bin/bash
rvm use system

if [ $# -eq 1 ]
then
        channel=$1
else
        channel=2
fi

while true
do
	./doubanfm.sh $channel 2> /dev/null
done
