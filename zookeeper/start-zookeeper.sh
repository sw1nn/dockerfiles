#!/bin/bash


LOG_DIR="/logs/zookeeper/${HOSTNAME}"
mkdir -p "${LOG_DIR}"

DATA_DIR="/data/zookeeper/${HOSTNAME}"
mkdir -p ${DATA_DIR}

sed -i \
    -e "s@zookeeper\.log\.dir=.*@zookeeper.log.dir=${LOGDIR}@" \
    -e "s@zookeeper\.tracelog\.dir=.*@zookeeper.log.dir=${LOGDIR}@" \
    /zookeeper/conf/log4j.properties

sed -e "s@dataDir=.*@dataDir=/data/zookeeper/${HOSTNAME}@" \
    /zookeeper/conf/zoo_sample.cfg > /zookeeper/conf/zoo.cfg


/zookeeper/bin/zkServer.sh start-foreground
