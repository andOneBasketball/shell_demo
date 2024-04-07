#!/bin/bash

timeout=1

#kafka
curl x.x.x.19:9092 -m ${timeout}
curl x.x.x.20:9092 -m ${timeout}
curl x.x.x.21:9092 -m ${timeout}
curl x.x.x.22:9092 -m ${timeout}
curl x.x.x.23:9092 -m ${timeout}