#!/bin/bash

kubectl get nodes -o wide | awk -F' ' 'NR>1{print $6}' | while read -r line
do
    echo ${line}
    ssh -T root@${line} << EOF
    ifconfig
    exit
EOF
done
