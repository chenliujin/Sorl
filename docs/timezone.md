


```
sed -i "s@#SOLR_TIMEZONE=\"UTC\"@SOLR_TIMEZONE=\"Asia/Shanghai\"@" /opt/solr/bin/solr.in.sh
```

# facet
- facet 是按 UTC 时间进行分组统计的，因此导入数据到 solr 时不能有时差，导入数据时直接 +8小时后存放到 solr 里面
