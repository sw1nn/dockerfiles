FROM mastodonc/basejava

RUN apt-get install -y nginx-full && \
    curl https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz | \
    tar -xzf - -C / --transform 's@\([a-z-]*\)-[0-9\.]*@\1@'

ADD nginx.conf /etc/nginx/nginx.conf

ADD start-kibana.sh /start-kibana

EXPOSE 80

CMD ["/bin/bash","/start-kibana"]
