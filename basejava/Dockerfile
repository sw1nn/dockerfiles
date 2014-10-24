FROM ubuntu
MAINTAINER Neale Swinnerton <neale@mastodonc.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y -q openjdk-7-jre-headless curl && \
    apt-get clean && \
    apt-get autoclean

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
