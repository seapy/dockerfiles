# kibana

* java 8

# Usage

```shell
$ docker run -d -p 8080:5601 \
    -e ES_URL=http://172.17.0.13:9200 \
    seapy/kibana:4.0.0-BETA2
```

# How to build

```shell
$ docker build -t seapy/kibana:4.0.0-BETA2 .
```
