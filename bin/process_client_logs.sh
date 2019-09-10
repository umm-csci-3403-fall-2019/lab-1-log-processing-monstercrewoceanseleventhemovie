#!/usr/bin/env bash


#directory=$1
#$directory/var/log
#current_direct=$(pwd)

cd "$1"

#files=$(find $current_direct -type f -printf "%f\n")

#for i in $files
#do
	sed -En 's/(^.{0,9}):([0-9]+):([a-zA-Z0-9 _]+)\[([0-9]+)\]:([a-zA-Z ]+) for (invalid user )?([a-zA-Z0-9 _-]+) from ([0-9.]+) (.+)/\1 \7 \8/p' -r var/log/* > failed_login_data.txt
#done

