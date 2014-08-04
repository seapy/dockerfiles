FROM dockerfile/elasticsearch
MAINTAINER ChangHoon Jeong <iamseapy@gmail.com>

ENV ES_HEAP_SIZE 1g

ADD logging.yml /data/conf/logging.yml
ADD elasticsearch.yml /data/conf/elasticsearch.yml

RUN ["/elasticsearch/bin/plugin", "--install", "-Des.config=/data/conf/elasticsearch.yml", "royrusso/elasticsearch-HQ"]
RUN ["/elasticsearch/bin/plugin", "--install", "-Des.config=/data/conf/elasticsearch.yml", "lukas-vlcek/bigdesk"]
RUN ["/elasticsearch/bin/plugin", "--install", "-Des.config=/data/conf/elasticsearch.yml", "lmenezes/elasticsearch-kopf"]
RUN ["/elasticsearch/bin/plugin", "--install", "-Des.config=/data/conf/elasticsearch.yml", "mobz/elasticsearch-head"]
RUN ["/elasticsearch/bin/plugin", "--install", "-Des.config=/data/conf/elasticsearch.yml", "karmi/elasticsearch-paramedic"]

ENTRYPOINT ["/elasticsearch/bin/elasticsearch", "--path.conf=/data/conf"]