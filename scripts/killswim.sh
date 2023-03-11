#!/bin/bash
# ps -ef|awk '$2=='`pgrep a.out`'{print $3}' | xargs kill
pkill swim.sh
pkill run.sh
pkill a.out
