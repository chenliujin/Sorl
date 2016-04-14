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
 * keyword 的搜索次数?
 * 多语言
```
  <searchComponent name="suggest" class="solr.SuggestComponent">
    <lst name="suggester">
      <str name="name">en</str>
      <str name="lookupImpl">FuzzyLookupFactory</str>
      <str name="dictionaryImpl">DocumentDictionaryFactory</str>
      <str name="field">title</str>
      <str name="weightField">title</str>
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
### 构建索引

### 查询测试
http://127.0.0.1:8080/solr/suggest?q=ipho&wt=json&indent=true

## Lookup Implementations
### AnalyzingLookupFactory
### FuzzyLookupFactory
### AnalyzingInfixLookupFactory
### BlendedInfixLookupFactory

## Q & A
* 多语言（中文）
* 权重

## 参考文献
* [Configure Solr -Suggester](http://romiawasthy.blogspot.hk/2014/06/configure-solr-suggester.html)
* [搜索引擎关键字智能提示的一种实现 - 美团](http://tech.meituan.com/pinyin-suggest.html)
* [Solr的自动完成实现方式（第二部分：Suggester方式）](http://www.cnblogs.com/ibook360/archive/2011/11/30/2269077.html)
* [Suggester](https://cwiki.apache.org/confluence/display/solr/Suggester)
* [solr的suggest模块](http://www.cnblogs.com/yjf512/p/5166382.html)
