#!/bin/bash

LOG_CONFIG_FILE=/kafka/config/log4j.properties
SERVER_CONFIG_FILE=/kafka/config/server.properties

BROKER_ID=${KAFKA_BROKER_ID:-0}

LOGS_DIR="/logs/kafka/${HOSTNAME}/${BROKER_ID}"
mkdir -p "${LOGS_DIR}"

DATA_DIR="/data/kafka/${HOSTNAME}/${BROKER_ID}"
mkdir -p ${DATA_DIR}

sed -i \
    -e "s@zookeeper\.connect=localhost@zookeeper.connect=${ZK01_PORT_2181_TCP_ADDR}@" \
    -e "s@#host\.name=localhost@host.name=${HOSTNAME}@" \
    -e "s@broker\.id=0@broker.id=${BROKER_ID}@" \
    -e "s@log\.dirs=/tmp/kafka-logs@log.dirs=${DATA_DIR}@" \
    ${SERVER_CONFIG_FILE}

if [ ! -z "${ADVERTISED_PORT}" ]; then
    sed -i \
	-e "s@#advertised\.port=.*@advertised.port=${ADVERTISED_PORT}@" \
	${SERVER_CONFIG_FILE}
fi

sed -i \
    -e "s@kafka.logs.dir=.*@kafka.logs.dir=${LOGS_DIR}/@" \
    -e "/log4j.logger.kafka=INFO, kafkaAppender/d" \
    ${LOG_CONFIG_FILE}

cat <<EOF >> ${LOG_CONFIG_FILE}

# Add Logstash Appender
log4j.appender.logstashAppender=org.apache.log4j.net.SocketAppender
log4j.appender.logstashAppender.Port=${LOGSTASH_PORT_4561_TCP_PORT}
log4j.appender.logstashAppender.RemoteHost=${LOGSTASH_PORT_4561_TCP_ADDR}
log4j.appender.logstashAppender.ReconnectionDelay=30000

log4j.logger.kafka=INFO, kafkaAppender, logstashAppender
EOF

/kafka/bin/kafka-server-start.sh /kafka/config/server.properties
