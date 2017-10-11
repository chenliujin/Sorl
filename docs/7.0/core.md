# docker

## 目录映射和目录权限
- -v /opt/solr/server/solr_tmp/:/opt/solr/server/solr_tmp/
- 在 solr docker 里面 cp -R /opt/solr/server/solr/* /opt/solr/server/solr_tmp/
- mv /opt/solr/server/solr_tmp /opt/solr/server/solr

```
$ docker exec -it --user=root solr bash
$ chown -R solr:solr /opt/solr/server/solr/
```

## 创建 core

```
docker exec -it --user=solr my_solr bin/solr create_core -c demo
```


