#!/bin/bash

LOGDIR="/logs/zookeeper/${HOSTNAME}"

mkdir -p "${LOGDIR}"

sed -i \
    -e "s@zookeeper\.log\.dir=.*@zookeeper.log.dir=${LOGDIR}@" \
    -e "s@zookeeper\.tracelog\.dir=.*@zookeeper.log.dir=${LOGDIR}@" \
    /zookeeper/conf/log4j.properties

/zookeeper/bin/zkServer.sh start-foreground
