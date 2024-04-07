#!/bin/bash

# 通过lsof -p 输出所有进程信息，查看 NAME 是否包含待查询的文件信息
query_file_list=(
    "curl"
)

pids="$(ps -auxf | awk -F' ' 'NR!=1{print $2}')"
ps_data="$(ps -auxf | awk 'NR!=1{print}')"
:>"./lsof_data.txt"
:>"./result.txt"

linenum=1
echo "$pids" | while read line
do
    for filename in ${query_file_list[*]}
    do
        lsofdata="$(lsof -p $line)"
        ps_data_line="$(echo "${ps_data}" | awk "NR==${linenum}{print}")"
        echo "${ps_data_line}" >> "./lsof_data.txt"
        echo "${lsofdata}" >> "./lsof_data.txt"
        echo -e "\n" >> "./lsof_data.txt"

        res=$(echo "${lsofdata}" | grep "${filename}")
        if [[ "x${res}" != "x" ]]; then
            echo "${ps_data_line}" >> "./result.txt"
            echo "${res}" >> "./result.txt"
            echo -e "\n" >> "./lsof_data.txt"
        fi
        let linenum=$linenum+1
    done
done

