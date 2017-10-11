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

## 字段定义
- managed-schema


## dataimport
- mysql-connector-java-5.1.42-bin.jar

```
$ vim solrconfig.xml
```

配置
```
  <lib dir="${solr.install.dir:../../../..}/dist/" regex="solr-dataimporthandler-.*\.jar" />

  <requestHandler name="/dataimport" class="org.apache.solr.handler.dataimport.DataImportHandler">
          <lst name="defaults">
                  <str name="config">data-config.xml</str>
          </lst>
  </requestHandler>
```

## data-config.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<dataConfig>
    <dataSource type="JdbcDataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://127.0.0.1:3306/db_jx" user="root" password="root" batchSize="-1" />
　　<document>
        <entity name="mycore_test" query="select id ,vip,point,content,add_time from solr_mycore">
             <!--column的id是数据库的id,name的id是managed_schema里面的id，id是必须，并且唯一的-->
            <field column="id" name="id" />
             <!--column的vip是数据库的vip字段,name的vip是managed_schema里面的vip,下面配置同理-->
            <field column="vip" name="vip" />
            <field column="point" name="point" />
            <field column="content" name="content" />
            <field column="add_time" name="add_time" />
        </entity>
    </document>
</dataConfig>
```

## 执行数据导入
