TASK_SET=test-1
#CORE_MASK=0xf
DSID=1
CMD=$*

mkdir -p /sys/fs/cgroup/dsid/$TASK_SET
eval "$CMD &"
PID=$!
echo pid is $PID
echo $PID > /sys/fs/cgroup/dsid/$TASK_SET/tasks
echo $DSID > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-set
