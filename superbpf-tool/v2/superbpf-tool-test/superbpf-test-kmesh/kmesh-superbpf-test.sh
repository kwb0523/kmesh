#!/bin/bash
ROOT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

rm -rf $ROOT_DIR/bpf/kmesh/bpf2go/*_rewrite.o

export LD_LIBRARY_PATH=/usr/lib/
/root/superbpf-tool-v2/superbpf $ROOT_DIR/bpf/kmesh/bpf2go/kmeshcgroupsock_bpfel.o > kmeshcgroupsock_bpfel.o.log 2>&1 &
sleep 3
/root/superbpf-tool-v2/superbpf $ROOT_DIR/bpf/kmesh/bpf2go/kmeshsockops_bpfel.o > kmeshsockops_bpfel.o.log 2>&1 &
sleep 3
/root/superbpf-tool-v2/superbpf $ROOT_DIR/bpf/kmesh/bpf2go/kmeshtracepoint_bpfel.o > kmeshtracepoint_bpfel.o.log 2>&1 &
sleep 3

time=0
#while true
while [ $time -lt 50 ]
do
    if [ -f $ROOT_DIR/bpf/kmesh/bpf2go/kmeshcgroupsock_bpfel_rewrite.o ]; then
        cp -rf $ROOT_DIR/bpf/kmesh/bpf2go/kmeshcgroupsock_bpfel_rewrite.o $ROOT_DIR/bpf/kmesh/bpf2go/kmeshcgroupsock_bpfel.o
        break  # 执行完后跳出循环
    else
        sleep 5  # 等待5秒
    fi
    time=$[$time+1]
done

time=0
while [ $time -lt 50 ]
do
    if [ -f $ROOT_DIR/bpf/kmesh/bpf2go/kmeshsockops_bpfel_rewrite.o ]; then
        cp -rf $ROOT_DIR/bpf/kmesh/bpf2go/kmeshsockops_bpfel_rewrite.o $ROOT_DIR/bpf/kmesh/bpf2go/kmeshsockops_bpfel.o
        break  # 执行完后跳出循环
    else
        sleep 5  # 等待5秒
    fi
    time=$[$time+1]
done

time=0
while [ $time -lt 50 ]
do
    if [ -f $ROOT_DIR/bpf/kmesh/bpf2go/kmeshtracepoint_bpfel_rewrite.o ]; then
        cp -rf $ROOT_DIR/bpf/kmesh/bpf2go/kmeshtracepoint_bpfel_rewrite.o $ROOT_DIR/bpf/kmesh/bpf2go/kmeshtracepoint_bpfel.o
        break  # 执行完后跳出循环
    else
        sleep 5  # 等待5秒
    fi
    time=$[$time+1]
done

pkill /root/superbpf-tool-v2/superbpf
