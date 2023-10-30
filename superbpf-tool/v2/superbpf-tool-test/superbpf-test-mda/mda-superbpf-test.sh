#!/bin/bash
ROOT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

rm -rf $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_ops.dir/*_rewrite.o
rm -rf $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_redirect.dir/*_rewrite.o

export LD_LIBRARY_PATH=/usr/lib/
/root/superbpf-tool-v2/superbpf $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_ops.dir/sock_ops.c.o > sock_ops.c.o.log 2>&1 &
sleep 3
/root/superbpf-tool-v2/superbpf $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_redirect.dir/sock_redirect.c.o > sock_redirect.c.o.log 2>&1 &
sleep 3

time=0
#while true
while [ $time -lt 100 ]
do
    if [ -f $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_ops.dir/*_rewrite.o ]; then
        cp -rf $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_ops.dir/*_rewrite.o $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_ops.dir/sock_ops.c.o
        break  # 执行完后跳出循环
    else
        sleep 5  # 等待5秒
    fi
    time=$[$time+1]
done

time=0
while [ $time -lt 50 ]
do
    if [ -f $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_redirect.dir/*_rewrite.o ]; then
        cp -rf $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_redirect.dir/*_rewrite.o $ROOT_DIR/oncn-mda/build/ebpf_src/CMakeFiles/sock_redirect.dir/sock_redirect.c.o
        break  # 执行完后跳出循环
    else
        sleep 5  # 等待5秒
    fi
    time=$[$time+1]
done

#pkill /root/superbpf-tool-v2/superbpf
