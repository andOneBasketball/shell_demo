## 基础知识

查看数据库查询语句执行耗时
explain("executionStats")
nReturned：表示该查询条件下返回的文档数量。
executionTimeMills：表示执行时间，单位毫秒
totalDocsExamined：表示该集合总共文档数。

在副本节点查看数据
rs.setSecondaryOk