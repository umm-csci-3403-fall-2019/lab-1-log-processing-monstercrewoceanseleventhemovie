#!/usr/bin/env bash

dir=$1 #name of a directory

#Takes the hours from the failed_login_data text file, sorts them, and counts them
sed -E 's/[a-zA-Z]* [0-9 ]* ([0-9]+) [a-zA-Z0-9 _-]* [0-9.]*/\1/' -r "$dir"/*/failed_login_data.txt \
	| sort \
	| uniq -c \
	| awk '/[ ]*([0-9]+) ([0-9]+)/{print "data.addRow([\x27" $2 "\x27, " $1 "]);\n"}' > "$dir"/hours_dist.txt #prints out hours and count inside of data.addRow function

#`wrap.contents.sh` takes 3 args:
	# 1) filename of "contents" to be wrapped
	# 2) name to specify desired header/footer
	# 3) filename of result

#Combines all hour HTML files
./bin/wrap_contents.sh "$dir"/hours_dist.txt html_components/hours_dist "$dir"/hours_dist.html

rm -rf "$dir"/hours_dist.txt #file no longer used


