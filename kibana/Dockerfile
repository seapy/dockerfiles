FROM dockerfile/java:oracle-java8

ENV KIBANA_PKG_NAME kibana-4.0.1-linux-x64

RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/kibana/kibana/$KIBANA_PKG_NAME.tar.gz && \
  tar xvzf $KIBANA_PKG_NAME.tar.gz && \
  mv /tmp/$KIBANA_PKG_NAME /kibana

ENV KIBANA_PORT 5601
ENV KIBANA_HOST 0.0.0.0
ENV ES_URL http://example.es.com:9200
ENV KIBANA_INDEX .kibana
ENV APP_ID discover
ENV REQUEST_TIMEOUT 300000
ENV SHARD_TIMEOUT 0
ENV VERIFY_SSL false

ADD kibana.yml /kibana/config/kibana.yml
ADD ./setup_configs.sh /kibana/setup_configs.sh
RUN chmod +x /kibana/setup_configs.sh

WORKDIR /kibana
EXPOSE 5601
CMD ./setup_configs.sh && /kibana/bin/kibana