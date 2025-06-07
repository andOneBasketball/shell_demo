#!/bin/bash

# 查看 kafka 的所有 topic
/usr/local/kafka_2.1-2.4.0-SNAPSHOT/bin/kafka-topics.sh --zookeeper kafka-zookeeper-1.novalocal,kafka-zookeeper-2.novalocal,kafka-zookeeper-3.novalocal --list

/path/to/kafka/bin/kafka-topics.sh --version

# 删除 topic
./kafka-topics.sh --zookeeper kafka-zookeeper-1.novalocal,kafka-zookeeper-2.novalocal,kafka-zookeeper-3.novalocal --delete --topic hello

# 创建 topic
./kafka-topics.sh --zookeeper kafka-zookeeper-1.novalocal,kafka-zookeeper-2.novalocal,kafka-zookeeper-3.novalocal --create --topic hello --partitions 10 --replication-factor 2 --config retention.bytes=1073741824 --config segment.bytes=104857600

# 查看 kafka 历史消息
./kafka-console-consumer.sh --bootstrap-server kafka-zookeeper-1.novalocal,kafka-zookeeper-2.novalocal,kafka-zookeeper-3.novalocal --topic hello --group hk-68422 --from-beginning --property print.timestamp=true

# 查看 group 的协调者
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-group

# 发送消息
./bin/kafka-console-producer.sh --topic hids-file-info-check --broker-list kafka-1.novalocal:9092,kafka-2.novalocal:9092,kafka-3.novalocal:9092

# 查看kafka存储大小
./kafka-topics.sh --zookeeper kafka-zookeeper-1.novalocal,kafka-zookeeper-2.novalocal,kafka-zookeeper-3.novalocal --describe  --topic hello
