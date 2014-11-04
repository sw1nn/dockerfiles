#!/bin/bash

# Unclear to me whether this is an issue with the datastax env code, but
# for the version of jdk we're using 228k is the minimum accepted stack size,
# tweak the config
#q
# TODO investigate the reason for this.
sed -i -e "s@-Xss180k@-Xss228k@" /apache-cassandra/conf/cassandra-env.sh

echo -e "data_file_directories:\n  -   /data/cassandra/${HOSTNAME}/" >> /apache-cassandra/conf/cassandra.yaml

/apache-cassandra/bin/cassandra -f
