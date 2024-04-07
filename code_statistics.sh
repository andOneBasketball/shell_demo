#!/bin/bash

# 统计代码仓库的的代码规模

code_path="${1}"
code_pathlist=$(ls "${code_path}")
project_codeline=0

while read -r line
do
    if [[ "x${line}" == "x" ]]; then
        continue
    fi
    cd "${code_path}/${line}"
    num=$(git ls-files | xargs cat | wc -l)
    let project_codeline=project_codeline+num
    #echo "codeline: ${project_codeline}"
    cd ..
done << EOF
$code_pathlist
EOF

echo "total lines of code: ${project_codeline}"
