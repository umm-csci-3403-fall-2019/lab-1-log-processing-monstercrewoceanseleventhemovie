#!/usr/bin/env bash

mkdir /tmp/frogs

temp_dir=/tmp/frogs #single temp directory

for dir in "$@" #untars each folder and processes the contents in each created directory
do
	computer=$(basename "$dir" .tgz)
	mkdir -p "$temp_dir"/"$computer"
	tar zxf "$dir" --directory "$temp_dir"/"$computer"
	./bin/process_client_logs.sh "$temp_dir"/"$computer"
done

#creates all of the desired HTML info
./bin/create_username_dist.sh "$temp_dir"
./bin/create_hours_dist.sh "$temp_dir"
./bin/create_country_dist.sh "$temp_dir"
./bin/assemble_report.sh "$temp_dir"

mv "$temp_dir"/failed_login_summary.html "$(pwd)" #moves the final HTML summary to the project's working directory

rm -rf "$temp_dir" #remove the temp directory
