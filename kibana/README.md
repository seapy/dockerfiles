# kibana

* java 8

# Usage

```shell
$ docker run -d -p 5601:5601 \
    -e ES_URL=http://192.168.59.103:9200 \
    seapy/kibana:4.0.1
```

# How to build

```shell
$ docker build -t seapy/kibana:4.0.1 .
```
