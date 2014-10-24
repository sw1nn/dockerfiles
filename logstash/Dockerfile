FROM mastodonc/basejava


# Download version 1.4.2 of logstash
RUN curl https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz | \
    tar -xzf - -C /opt --transform 's@\([a-z-]*\)-[0-9\.]*@\1@'

# Install contrib plugins
RUN /opt/logstash/bin/plugin install contrib

# Copy build files to container root
RUN mkdir /app
ADD . /app

# Elasticsearch HTTP
EXPOSE 9200
# Elasticsearch transport
EXPOSE 9300

# Kibana
EXPOSE 9292

# Start logstash
ENTRYPOINT ["/app/bin/boot"]
