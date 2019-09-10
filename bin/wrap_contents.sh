#!/usr/bin/env bash

text=$1
name=$2
place=$3

cat "${name}_header.html" ${text} "${name}_footer.html" > "${place}"
