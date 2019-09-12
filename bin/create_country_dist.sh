#!/usr/bin/env bash

dir=$1 #name of a directory

awk -r '{print $5}' log_files/*/failed_login_data.txt \
	| sort > "$dir"/ip.txt
      	
join "$dir"/ip.txt etc/country_IP_map.txt \
	| awk '{print $2 " " $1}' \
	| sort \
	| awk '{print $1}' \
	| uniq -c \
	| awk '{print "data.addRow([\x27" $2 "\x27, " $1 "]);\n"}' > "$dir"/country_dist.txt

./bin/wrap_contents.sh "$dir"/country_dist.txt html_components/country_dist "$dir"/country_dist.html

rm -rf "$dir"/ip.txt
rm -rf "$dir"/country_dist.txt
