TASK_SET=test-1

echo bucket_freq 0x80 > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-cp
echo bucket_size 0x80 > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-cp
echo bucket_inc 0x80 > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-cp
echo l2_waymask 0xffff > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-cp
