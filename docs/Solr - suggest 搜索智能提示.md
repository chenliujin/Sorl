## 版本
* solr-5.2.1

## 配置
### solrconfig.xml
* field: 数据来源字段
```
<searchComponent name="suggest" class="solr.SuggestComponent">
    <lst name="suggester">
      <str name="name">mySuggester</str>
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
      <str name="suggest.dictionary">mySuggester</str>
    </lst>
    <arr name="components">
      <str>suggest</str>
    </arr>
  </requestHandler>
```

## 参考文献
* [Configure Solr -Suggester](http://romiawasthy.blogspot.hk/2014/06/configure-solr-suggester.html)
