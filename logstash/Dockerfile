FROM mastodonc/basejava

# Download version 1.4.2 of logstash
RUN curl https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz | \
    tar -xzf - -C / --transform 's@\([a-z-]*\)-[0-9\.]*@\1@'

# Install contrib plugins
RUN /logstash/bin/plugin install contrib

ADD logstash.conf /logstash/logstash.conf
ADD start-logstash.sh /start-logstash

# 4560 - socker appender for logback (keep in sync with logstash.conf
# 4560 - socker appender for log4j (keep in sync with logstash.conf
# 9092 - web interface to logstash.
EXPOSE 4560 4561 9092

# Start logstash
CMD ["/bin/bash", "/start-logstash"]
