#!/usr/bin/env bash

cd "$1"

sed -En 's/(^.{0,9}):([0-9]+):([a-zA-Z0-9 _]+)\[([0-9]+)\]: Failed password for (invalid user )?([a-zA-Z0-9 _-]+) from ([0-9.]+) (.+)/\1 \6 \7/p' -r var/log/* > failed_login_data.txt



