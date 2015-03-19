FROM dockerfile/java:oracle-java8
MAINTAINER ChangHoon Jeong <iamseapy@gmail.com>

ENV ES_PKG_NAME elasticsearch-1.4.4

# Install ElasticSearch.
RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

ENV ES_HEAP_SIZE 1g

ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

RUN ["/elasticsearch/bin/plugin", "--install", "lmenezes/elasticsearch-kopf/1.4.6"]
RUN ["/elasticsearch/bin/plugin", "--install", "royrusso/elasticsearch-HQ"]
RUN ["/elasticsearch/bin/plugin", "--install", "lukas-vlcek/bigdesk"]
RUN ["/elasticsearch/bin/plugin", "--install", "mobz/elasticsearch-head"]
RUN ["/elasticsearch/bin/plugin", "--install", "karmi/elasticsearch-paramedic"]

ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]