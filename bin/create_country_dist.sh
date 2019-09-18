#!/usr/bin/env bash

dir=$1 #name of a directory

#Takes the IP address from the failed_login_data text file and sorts them
awk -r '{print $5}' "$dir"/*/failed_login_data.txt \
	| sort > "$dir"/ip.txt
      	
#Joins the IP addresses with the matching countries, and then sorts and counts the countries
join "$dir"/ip.txt etc/country_IP_map.txt \
	| awk '{print $2}' \
	| sort \
	| uniq -c \
	| awk '{print "data.addRow([\x27" $2 "\x27, " $1 "]);\n"}' > "$dir"/country_dist.txt #prints data.addRow() for each country counted

#Combines all of the html files together into country_dist.html
./bin/wrap_contents.sh "$dir"/country_dist.txt html_components/country_dist "$dir"/country_dist.html

#Removes intermediate files
rm -rf "$dir"/ip.txt
rm -rf "$dir"/country_dist.txt
