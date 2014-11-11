# fluentd-es

Docker containers log to elsticsearch using fluentd

All containers log send to elaticsearch(/var/lib/docker/containers/*/*-json.log)

* installed fluentd(actually td-agent) by apt-get 
* installed fluentd-elasticsearch plugin
* change user `td-agent` to `root`

## How To Run

```
$ docker run -d \
    --name fluentd-es \
    -v /var/lib/docker:/var/lib/docker \
    -e ES_HOSTS=192.168.0.1:9200,192.168.0.2:9200 \
    seapy/fluentd-es
```

## Build & Push

```
$ docker build -t seapy/fluentd-es .
$ docker push seapy/fluentd-es
```

## Refrence

* kubernetes logging
  * https://github.com/GoogleCloudPlatform/kubernetes/blob/master/contrib/logging/fluentd-es-image/Dockerfile