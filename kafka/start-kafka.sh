#!/bin/bash

BROKER_ID=${KAFKA_BROKER_ID:-0}

LOG_DIR="/logs/kafka/${HOSTNAME}/${BROKER_ID}"
mkdir -p "${LOG_DIR}"

DATA_DIR="/data/kafka/${HOSTNAME}/${BROKER_ID}"
mkdir -p ${DATA_DIR}

sed -i \
    -e "s@zookeeper.connect=localhost@zookeeper.connect=${ZK01_PORT_2181_TCP_ADDR}@" \
    -e "s@host.name=localhost@host.name=${HOSTNAME}@" \
    -e "s@broker.id=0@broker.id=${BROKER_ID}@" \
    -e "s@log.dirs=/tmp/kafka-logs@log.dirs=${DATA_DIR}@" \
    /kafka/config/server.properties

sed -i \
    -e "s@kafka.logs.dir=.*@kafka.logs.dir=${LOG_DIR}/@"
    /kafka/config/log4j.properties

/kafka/bin/kafka-server-start.sh /kafka/config/server.properties
