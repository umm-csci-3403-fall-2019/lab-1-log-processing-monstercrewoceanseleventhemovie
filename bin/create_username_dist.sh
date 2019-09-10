#!/usr/bin/env bash

dir=$1

sed -E 's/(^.{0,9}) ([a-zA-Z0-9 _-]+) ([0-9.]+)/\2/' -r log_files/*/failed_login_data.txt | sort | uniq -c | awk '/([ ]+)([0-9]+) ([a-zA-Z0-9_-]+)/{print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' > $dir/username_dist.html

