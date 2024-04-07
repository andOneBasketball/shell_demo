#!/bin/bash

# eg: bash get_rule_data.sh 20220822000000 20221112000000 a b c d

add_time_start=$(date -d "${1:0:4}-${1:4:2}-${1:6:2} ${1:8:2}:${1:10:2}:${1:12:2}" +%s)
add_time_end=$(date -d "${2:0:4}-${2:4:2}-${2:6:2} ${2:8:2}:${2:10:2}:${2:12:2}" +%s)
echo "${add_time_start} ${add_time_end}"
product=()
for((i=3,j=0;i<=$#;i++,j++))
do
    eval product[${j}]='${'"${i}"'}'
done


function get_rules_data()
{
    for key in ${product[*]}
    do
        echo "${key} data data:"
        dbname="db_hello_data"
        # 输出顺序 白指纹 文件路径白名单规则 的新增数量
        mongo -u root  --password='xxxxxxxxx' --authenticationDatabase=admin <<EOF
        use $dbname;
        db.tb_hello.find({"product":"$key","data":101,"add_time":{"\$lte":$add_time_end,"\$gte":$add_time_start}}).count();
        db.tb_hello.find({"product":"$key","data":101,"add_time":{"\$lte":$add_time_end,"\$gte":$add_time_start}}).count();
        exit
EOF
    done
}

function main()
{
    get_rules_data
}

main
