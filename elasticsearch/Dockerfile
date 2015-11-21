# from https://github.com/dockerfile/java/blob/master/oracle-java8/Dockerfile
# from https://github.com/nacyot/elasticsearch
FROM ubuntu:14.04
MAINTAINER ChangHoon Jung <iamseapy@gmail.com>

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*


# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

RUN \
  apt-get update &&\
  apt-get install -y automake perl build-essential

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV ES_PKG_NAME elasticsearch-2.0.0

# Install Elasticsearch.
RUN \
  cd / && \
  wget https://download.elastic.co/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch


# Define working directory.
WORKDIR /data

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
COPY elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Install elasticsearch plugin
RUN /elasticsearch/bin/plugin install mobz/elasticsearch-head

# Define default command.
ENTRYPOINT ["/elasticsearch/bin/elasticsearch", "-Djava.library.path=/usr/local/lib"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
