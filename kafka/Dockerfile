FROM mastodonc/basejava

RUN curl http://www.mirrorservice.org/sites/ftp.apache.org/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz | \
    tar -xzf - -C /opt --transform 's@\([a-z-]*\)-[0-9\.-]*@\1@'

ADD kafka-start.sh /usr/local/bin/kafka-start
RUN chmod +x /usr/local/bin/kafka-start

CMD ["kafka-start"]
EXPOSE 9092
