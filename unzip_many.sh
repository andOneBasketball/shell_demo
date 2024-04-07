#!/bin/bash

find ./ -name "*.zip" | while read line
do
    fold_name="${line%.zip*}"
    unzip -o "${line}" -d "${fold_name}" 1>/dev/null
done
