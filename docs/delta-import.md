


# 计划任务

```
* * * * * nohup curl http://127.0.0.1:8983/solr/staffer_manual/dataimport?command=delta-import&clean=false&commit=true > /dev/null 2 > &1
```



# 参考文献
- http://www.cnblogs.com/luxiaoxun/p/4442770.html
- https://wiki.apache.org/solr/DataImportHandler
