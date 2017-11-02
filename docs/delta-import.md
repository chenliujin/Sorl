

# DIH 导入时 last_index_time 小于当前时间 8 小时

```
RUN sed -i "s@#SOLR_TIMEZONE=\"UTC\"@SOLR_TIMEZONE=\"Asia/Shanghai\"@" /opt/solr/bin/solr.in.sh

docker restart solr
```

# Notice
- 需要注意服务器时间差


# 计划任务

```
* * * * * curl http://127.0.0.1:8983/solr/staffer_manual/dataimport?command=delta-import&clean=false&commit=true
```



# 参考文献
- http://www.cnblogs.com/luxiaoxun/p/4442770.html
- https://wiki.apache.org/solr/DataImportHandler
