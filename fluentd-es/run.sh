#!/bin/bash

sed -i -e "s/\%ES_HOSTS\%/${ES_HOSTS}/" /etc/td-agent/td-agent.conf
/usr/sbin/td-agent "$@"