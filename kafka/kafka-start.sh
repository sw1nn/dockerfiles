#!/bin/bash

sed -e "s/zookeeper.connect=localhost/zookeeper.connect=${ZK_PORT_2181_TCP_ADDR}/" \
    -e "s/host.name=localhost/host.name=${HOSTNAME}/"
    -e "s/broker.id=0/broker.id=${KAFKA_BROKER_ID:-0}/" \
    /opt/kafka/config/server.properties > /tmp/server.properties

/opt/kafka/bin/kafka-server-start.sh /tmp/server.properties
