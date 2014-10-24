FROM mastodonc/basejava

RUN curl https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.4.tar.gz | \
    tar -xzf - -C /opt --transform 's@\([a-z-]*\)-[0-9\.]*@\1@'

VOLUME ["/data"]

ADD config/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

WORKDIR /data

CMD ["/opt/elasticsearch/bin/elasticsearch"]
# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200 9300
