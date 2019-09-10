#!/usr/bin/env bash

dir=$1

sed -E 's/(^.{0,9}) ([a-zA-Z0-9 _-]+) ([0-9.]+)/\2/' < ../log_files/zeus_secure/failed_login_data.txt | sort | uniq -c > test.txt
