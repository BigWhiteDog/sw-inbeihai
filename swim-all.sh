#!/bin/bash
for i in {1..16}
do
{
    echo "add dwarf: md5 sort wordcount md5_a @ 10.30.12.$i"
    ssh root@10.30.12.$i "~/scripts/swim.sh"
}
done