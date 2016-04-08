# Suggester - a flexible "autocomplete" component.

## 目的
搜索的智能提示目前是各大搜索的标配应用，主要作用是避免用户输入错误的搜索词，同时将用户引导到相应的关键词搜索上。

## Solr Suggest
该模块可选择基于提示词文本做智能提示，还支持通过针对索引的某个字段建立索引词库做智能提示。在诸多文档中都推荐使用基于索引来做智能提示，因此我们目前的实现也是采取该方案。

## 版本
* solr-5.2.1

## 配置

### Notice
请注意：solr.SpellCheckComponent 是低版本的旧的 solr suggest 的配置

### solrconfig.xml
* field: 来源字段
* suggest.dictionary 的值必须与 searchComponent 中 suggester 标签下 <str name=”name”>default</str> 配置对应，默认 default。
* 返回结果排序
 * 用户搜索词语的频率排序?
```
  <searchComponent name="suggest" class="solr.SuggestComponent">
    <lst name="suggester">
      <str name="lookupImpl">FuzzyLookupFactory</str>      <!-- org.apache.solr.spelling.suggest.fst -->
      <str name="dictionaryImpl">DocumentDictionaryFactory</str>     <!-- org.apache.solr.spelling.suggest.HighFrequencyDictionaryFactory -->
      <str name="field">title</str>
      <str name="weightField">price</str>
      <str name="suggestAnalyzerFieldType">string</str>
    </lst>
  </searchComponent>

  <requestHandler name="/suggest" class="solr.SearchHandler" startup="lazy">
    <lst name="defaults">
      <str name="suggest">true</str>
      <str name="suggest.count">10</str>
    </lst>
    <arr name="components">
      <str>suggest</str>
    </arr>
  </requestHandler>
```

### 查询测试
http://www.chenliujin.com:8080/solr/suggest?q=ipho&wt=json&indent=true

## 参考文献
* [Configure Solr -Suggester](http://romiawasthy.blogspot.hk/2014/06/configure-solr-suggester.html)
* [搜索引擎关键字智能提示的一种实现 - 美团](http://tech.meituan.com/pinyin-suggest.html)
* [Solr的自动完成实现方式（第二部分：Suggester方式）](http://www.cnblogs.com/ibook360/archive/2011/11/30/2269077.html)
