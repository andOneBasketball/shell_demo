#/bin/bash

mongo --host 127.0.0.1 -u root  --password='xxxxxx' --authenticationDatabase=admin

# db.hello.remove({"name": "hello"})

# 导出数据
mongoexport -d db_hello -c tb_hello -q '{"name":"hello"}'