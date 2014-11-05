FROM mastodonc/basejava

RUN curl http://www.mirrorservice.org/sites/ftp.apache.org/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz | \
    tar -xzf - -C / --transform 's@\([a-z-]*\)[-_][0-9\.-]*@\1@'

RUN mkdir -p /data/kafka

ADD start-kafka.sh /start-kafka

CMD ["/bin/bash","/start-kafka"]

EXPOSE 9092
