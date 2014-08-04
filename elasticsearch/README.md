# What's differ `dockerfile/elasticsearch`

* pre install useful plugin
  * HQ
  * bigdesk
  * kopf
  * head
  * paramedic


# Usage

```shell
# x.x.x.x server
$ docker run -d -p 9200:9200 -p 9300:9300 \
    -v /data/elasticsearch:/data/mnt \
    seapy/elasticsearch \
     --node.name=$(hostname) \
     --network.publish_host=$(hostname -i) \
     --discovery.zen.ping.multicast.enabled=false \
     --discovery.zen.ping.unicast.hosts=x.x.x.x:9300,y.y.y.y:9300
```

```shell
# y.y.y.y server
$ docker run -d -p 9200:9200 -p 9300:9300 \
    -v /data/elasticsearch:/data/mnt \
    seapy/elasticsearch \
     --node.name=$(hostname) \
     --network.publish_host=$(hostname -i) \
     --discovery.zen.ping.multicast.enabled=false \
     --discovery.zen.ping.unicast.hosts=x.x.x.x:9300,y.y.y.y:9300
```


# Override conf

you can overrinde config option like `cluster.name: my_cluster`

```shell
docker run -d ... seapy/elasticsearch --cluster.name: my_cluster
```


# Info

`--network.publish_host` options is key point. when you missed this, unicast cluster can't work.

[Running an ElasticSearch Cluster on CoreOS](http://mattupstate.com/coreos/devops/2014/06/26/running-an-elasticsearch-cluster-on-coreos.html)