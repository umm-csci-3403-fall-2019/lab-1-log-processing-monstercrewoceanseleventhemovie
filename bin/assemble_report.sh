#!/usr/bin/env bash

dir=$1 #the directory where all of the HTML files reside

cat "$dir"/country_dist.html "$dir"/hours_dist.html "$dir"/username_dist.html > "$dir"/summary_plot.txt
./bin/wrap_contents.sh "$dir"/summary_plot.txt html_components/summary_plots "$dir"/failed_login_summary.html

rm -rf "$dir"/summary_plot.txt #removes the intermediate summary data
