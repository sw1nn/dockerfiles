#!/bin/bash

LOG_DIR="/logs/kibana/${HOSTNAME}"
mkdir -p "${LOG_DIR}"

DATA_DIR="/data/kibana/${HOSTNAME}"
mkdir -p ${DATA_DIR}
ES_URL="${ES_SCHEME:-http}://${ES_PORT_9200_TCP_ADDR}:${ES_PORT_9200_TCP_PORT:-9200}"

echo "Elastic Search URL is ${ES_URL}"

sed -i \
    -e "s@{{error_log}}@/logs/kibana/${HOSTNAME}/error.log@" \
    -e "s@{{kibana_access_log}}@/logs/kibana/${HOSTNAME}/access.log@" \
    -e "s@{{es_access_log}}@/logs/kibana/${HOSTNAME}/es-access.log@" \
    -e "s@{{es_url}}@${ES_URL}@" \
    /etc/nginx/nginx.conf

cat << EOF > /kibana/config.js
define(['settings'],
function (Settings) {
  return new Settings({
    elasticsearch: "http://localhost:8080",
    default_route: "/dashboard/file/logstash.json",
    kibana_index: "kibana-int",
    panel_names: [
      'histogram',
      'map',
      'goal',
      'table',
      'filtering',
      'timepicker',
      'text',
      'hits',
      'column',
      'trends',
      'bettermap',
      'query',
      'terms',
      'stats',
      'sparklines'
    ]
  });
});
EOF

nginx -c /etc/nginx/nginx.conf
