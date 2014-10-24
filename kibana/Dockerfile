FROM mastodonc/basejava

RUN apt-get install -y nginx-full && \
    curl https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz | \
    tar -xzf - -C /usr/share/nginx/html --strip-components 1

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD run.sh /usr/local/bin/run

EXPOSE 80

CMD ["/usr/local/bin/run"]
