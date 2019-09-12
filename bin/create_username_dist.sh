#!/usr/bin/env bash

dir=$1 #Takes 1 arg: name of a directory

sed -E 's/(^.{0,9}) ([a-zA-Z0-9 _-]+) ([0-9.]+)/\2/' -r log_files/*/failed_login_data.txt \
	| sort \
	| uniq -c \
	| awk '/([ ]+)([0-9]+) ([a-zA-Z0-9_-]+)/{print "data.addRow([\x27" $2 "\x27, " $1 "]);\n"}' > "$dir"/username_dist.txt  

#`wrap.contents.sh` takes 3 args: 
	# 1) filename of "contents" to be wrapped
	# 2) name to specify desired header/footer
	# 3) filename of result

./bin/wrap_contents.sh "$dir"/username_dist.txt html_components/username_dist "$dir"/username_dist.html

rm -rf "$dir"/username_dist.txt #file no longer used
