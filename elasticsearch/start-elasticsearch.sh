#!/bin/bash

LOG_DIR="/logs/elasticsearch/${HOSTNAME}"
mkdir -p "${LOG_DIR}"

DATA_DIR="/data/elasticsearch/${HOSTNAME}"
mkdir -p ${DATA_DIR}

sed -i \
    -e "s@#path.plugins: .*@path.plugins: ${DATA_DIR}/plugins@" \
    -e "s@#path.data: .*@path.data: ${DATA_DIR}/data@" \
    -e "s@#path.logs: .*@path.logs: ${LOG_DIR}/log@" \
    -e "s@#path.work: .*@path.work: ${DATA_DIR}/work@" \
    /elasticsearch/config/elasticsearch.yml

/elasticsearch/bin/elasticsearch
