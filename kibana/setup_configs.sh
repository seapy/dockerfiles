#!/bin/bash

sed -i -e "\#::KIBANA_HOST::# s#::KIBANA_HOST::#${KIBANA_HOST}#g" /kibana/config/kibana.yml
sed -i -e "\#::KIBANA_PORT::# s#::KIBANA_PORT::#${KIBANA_PORT}#g" /kibana/config/kibana.yml
sed -i -e "\#::ES_URL::# s#::ES_URL::#${ES_URL}#g" /kibana/config/kibana.yml
sed -i -e "\#::KIBANA_INDEX::# s#::KIBANA_INDEX::#${KIBANA_INDEX}#g" /kibana/config/kibana.yml
sed -i -e "\#::APP_ID::# s#::APP_ID::#${APP_ID}#g" /kibana/config/kibana.yml
sed -i -e "\#::REQUEST_TIMEOUT::# s#::REQUEST_TIMEOUT::#${REQUEST_TIMEOUT}#g" /kibana/config/kibana.yml
sed -i -e "\#::SHARD_TIMEOUT::# s#::SHARD_TIMEOUT::#${SHARD_TIMEOUT}#g" /kibana/config/kibana.yml
sed -i -e "\#::VERIFY_SSL::# s#::VERIFY_SSL::#${VERIFY_SSL}#g" /kibana/config/kibana.yml
