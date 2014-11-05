#!/bin/bash

CONFIG_FILE=/logstash/logstash.conf

if [ -z "${ES_PORT_9300_TCP_ADDR}" -o -z "${ES_PORT_9300_TCP_PORT}" ]; then
    echo "Must link elasticsearch as es"
    exit 1
fi

sed -i \
    -e "s@{{es_hostname}}@${ES_PORT_9300_TCP_ADDR}@" \
    -e "s@{{es_port}}@${ES_PORT_9300_TCP_PORT}@" \
    ${CONFIG_FILE}

/logstash/bin/logstash agent \
		       --configtest \
		       --config /logstash/logstash.conf || exit 1

# Fire up logstash!
exec /logstash/bin/logstash \
     agent \
     --config ${CONFIG_FILE} \
     -- \
     web
