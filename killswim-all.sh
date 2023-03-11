#!/bin/bash
for i in {1..16}
do
{
    echo "kill dwarf @ 10.30.12.$i"
    ssh root@10.30.12.$i "~/scripts/killswim.sh"
}
done