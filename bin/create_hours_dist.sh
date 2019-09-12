#!/usr/bin/env bash

dir=$1 #name of a directory

sed -E 's/[a-zA-Z]* [0-9 ]* ([0-9]+) [a-zA-Z0-9 _-]* [0-9.]*/\1/' -r log_files/*/failed_login_data.txt \
	| sort \
	| uniq -c \
	| awk '/[ ]*([0-9]+) ([0-9]+)/{print "data.addRow([\x27" $2 "\x27, " $1 "]);\n"}' > "$dir"/hours_dist.txt

#`wrap.contents.sh` takes 3 args:
	# 1) filename of "contents" to be wrapped
	# 2) name to specify desired header/footer
	# 3) filename of result

./bin/wrap_contents.sh "$dir"/hours_dist.txt html_components/hours_dist "$dir"/hours_dist.html

rm -rf "$dir"/hours_dist.txt #file no longer used


