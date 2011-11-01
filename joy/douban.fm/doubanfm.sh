#!/bin/bash

# channel list
#
# 华语 1
# 欧美 2
# 粤语 6
# 法语 22
# 日语 17
# 韩语 18
#
# 民谣 8
# 摇滚 7
# 爵士 13
# 古典 27
# 轻音乐 9
# 电子 14
# R&B 16
# 说唱 15
# 电影原声 10

channel=2
player=`which mplayer2`

if [ $# -eq 1 ]
then
	channel=$1
fi


doubanURL="http://douban.fm/j/mine/playlist?type=n&channel=${channel}"

curl $doubanURL | \
ruby -e '
	while line = gets and match = line.scan(/(http[^"]*\.mp3)/)
		match.each {|m| puts m}
	end' | \
xargs $player
