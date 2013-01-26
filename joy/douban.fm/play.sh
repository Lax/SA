#!/bin/bash
#rvm use system
#export LANG='zh_CN.utf8'

if [ $# -eq 1 ]
then
        channel=$1
else
        channel=2
fi

while true
do
	sh ./doubanfm.sh $channel 2> /dev/null
	sleep 1
done
