#!/bin/bash

num=1
cat "network_detect.sh" | grep "curl" | while read -r line
do
    echo "$line"
    let num=$num+1
done

echo "$num"

num=1
while read -r line
do
    echo "$line"
    let num=$num+1
done < <(cat "network_detect.sh" | grep "curl")

echo "$num"
