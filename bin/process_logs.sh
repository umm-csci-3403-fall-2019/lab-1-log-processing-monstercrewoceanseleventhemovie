#!/usr/bin/env bash

mkdir /tmp/log_lab
for i in "$@"
do
	tar zxf "$i" --directory /tmp/log_lab
	computer=$(basename "$i" .tgz)
	echo "$computer"
	./bin/process_client_logs.sh /tmp/log_lab/"$computer"
done

