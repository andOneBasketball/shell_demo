#/bin/bash

mongo --host 127.0.0.1 -u root  --password='xxxxxx' --authenticationDatabase=admin

# db.tb_hello.remove({"name": "hello"})
# db.tb_hello.find({}).limit(1)


# 聚合查询
# 筛选data相同,按数量排序
# db.tb_hello.aggregate([{$group: { _id:'$data', count: {$sum: 1}}}, {$sort: {'count': -1}}, {$limit: 10}])


# 索引相关操作
# 查看热点索引
# db.tb_hello.aggregate([{$indexStats: {}}])

# 索引个数
# db.getSiblingDB("db_hello").tb_hello.stats().indexSizes

# 查看查询条件是否使用索引
# db.blockIp.find({ "banObjectRule.type": "DNS", "banObjectNames": { $in: [ "uqijwi.com" ] } }).sort({ "updateTime": -1 }).explain('executionStats')

# 查看当前数据库操作
# db.currentOP({"ns" : "db_hello.tb_hello"})

# 增加/删除索引
# db.tb_hello.dropIndex("data_-1")
# db.tb_hello.createIndex({"data": -1}, {"background": true, "expireAfterSeconds": 17280000})

# 创建分片键
# sh.shardCollection("$dbname.tb_hello", {"data": 1})

# 导出数据
mongoexport -h 127.0.0.1:27017 -u root  --password='xxxxx' --authenticationDatabase=admin -d db_hello -c tb_hello -q '{"name":"hello"}' -f name,id,product --csv -o /tmp/mongo_data.csv