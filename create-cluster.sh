#!/bin/bash
~/playground/redis-6.2.1/src/redis-cli --cluster create \
10.30.12.1:6379 10.30.12.2:6379 10.30.12.3:6379 10.30.12.4:6379 \
10.30.12.5:6379 10.30.12.6:6379 10.30.12.7:6379 10.30.12.8:6379 \
10.30.12.9:6379 10.30.12.10:6379 10.30.12.11:6379 10.30.12.12:6379 \
10.30.12.13:6379 10.30.12.14:6379 10.30.12.15:6379 10.30.12.16:6379 \
--cluster-replicas 1
