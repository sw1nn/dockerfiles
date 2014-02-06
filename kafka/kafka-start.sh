#!/bin/bash

sed -e "s/localhost/`echo ${ZK_PORT_2181_TCP_ADDR}`/" /opt/kafka_2.8.0-0.8.0/config/server.properties > /tmp/server.properties
/opt/kafka_2.8.0-0.8.0/bin/kafka-server-start.sh /tmp/server.properties
