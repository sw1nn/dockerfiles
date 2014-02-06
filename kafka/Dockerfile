FROM ubuntu
MAINTAINER Neale Swinnerton <neale@sw1nn.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y -q openjdk-7-jre-headless curl 
RUN curl -o /opt/kafka_2.8.0-0.8.0.tgz https://dist.apache.org/repos/dist/release/kafka/0.8.0/kafka_2.8.0-0.8.0.tar.gz
RUN tar -xzf /opt/kafka_2.8.0-0.8.0.tgz -C /opt/

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

ADD kafka-start.sh /usr/local/bin/kafka-start.sh
RUN chmod +x /usr/local/bin/kafka-start.sh

CMD ["/usr/local/bin/kafka-start.sh"]
EXPOSE 9092
