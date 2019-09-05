#!/usr/bin/env bash

directory=$1
$directory/var/log
current_direct=$(pwd)

files=$(find $current_direct -type f -printf "%f\n")

for i in $files
do
	sed -E 's/\([a-zA-Z0-9]+):/\1\n/' < $i >> failed_login_data.txt
done

