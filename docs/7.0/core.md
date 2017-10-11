# docker

## 目录权限

```
$ docker exec -it --user=root solr bash
$ chown -R solr:solr /opt/solr/server/solr/chenliujin 
```

## 创建 core

```
docker exec -it --user=solr my_solr bin/solr create_core -c demo
```


