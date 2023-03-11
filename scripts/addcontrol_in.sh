TASK_SET=test-1

echo bucket_freq 0x1000 > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-cp
echo bucket_inc 0x8 > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-cp
echo bucket_size 0x40 > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-cp
echo l2_waymask 0xf000 > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-cp