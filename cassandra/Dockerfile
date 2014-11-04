FROM mastodonc/basejava

RUN curl http://mirror.ox.ac.uk/sites/rsync.apache.org/cassandra/2.1.1/apache-cassandra-2.1.1-bin.tar.gz | \
    tar -xzf - -C / --transform 's@\([a-z-]*\)-[0-9\.]*@\1@'

ADD start-cassandra.sh /start-cassandra

############################################
# Make Oracle JDK the default.

CMD ["/bin/bash","/start-cassandra"]

# 9042 is CQL, 9160 is thrift
# TODO - remove thrift?
EXPOSE 9042 9160
