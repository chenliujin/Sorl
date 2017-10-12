FROM solr:7.0.1

MAINTAINER liujin.chen <liujin.chen@qq.com>

USER root

# 1.修改时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 

USER solr 

RUN sed -i "s@#SOLR_TIMEZONE=\"UTC\"@SOLR_TIMEZONE=\"Asia/Shanghai\"@" /opt/solr/bin/solr.in.sh

COPY ./lib/ /opt/solr/server/lib/


