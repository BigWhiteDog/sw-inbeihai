TASK_SET=
CORE_MASK=
DSID=
CMD=$*

mkdir -p /sys/fs/cgroup/dsid/$TASK_SET

eval "$CMD &"
PID=$!
taskset -p $CORE_MASK $PID
echo $PID > /sys/fs/cgroup/dsid/$TASK_SET/tasks
echo $DSID > /sys/fs/cgroup/dsid/$TASK_SET/dsid.dsid-set

