FROM ubuntu
MAINTAINER Neale Swinnerton

############################################
# needed for add-apt-repository
RUN apt-get update && apt-get -y install python-software-properties

############################################
# Install oracle jdk
RUN add-apt-repository -y  ppa:webupd8team/java

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN apt-get update

RUN apt-get -y -f install oracle-java7-installer


############################################
# Install datastax cassandra, basically the instructions from:
# http://www.datastax.com/documentation/cassandra/1.2/webhelp/index.html#cassandra/install/installDeb_t.html

RUN echo "deb http://debian.datastax.com/community stable main" >> /etc/apt/sources.list.d/cassandra.sources.list

RUN apt-key adv --keyserver keys.gnupg.net --recv-keys B999A372

RUN apt-get update && apt-get -y --force-yes install dsc12=1.2.10-1 cassandra=1.2.10 apt-utils

# Unclear to me whether this is an issue with the datastax env code, but
# for the version of jdk we're using 228k is the minimum accepted stack size,
# tweak the config
#
# TODO investigate the reason for this.
RUN sed -i -e 's/-Xss180k/-Xss228k/' /etc/cassandra/cassandra-env.sh


############################################
# Make Oracle JDK the default.
RUN apt-get -y -f install oracle-java7-set-default

CMD ["/usr/sbin/cassandra","-f"]

# 9042 is CQL, 9160 is thrift
# TODO - remove thrift?
EXPOSE 9042 9160


