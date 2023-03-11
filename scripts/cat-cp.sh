#!/bin/bash

while true;
do
flock -x /tmp/id_lock -c ~/scripts/cat-cp-in.sh
done
