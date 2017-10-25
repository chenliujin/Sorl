
# JSON Facet API (solr 5.1)

## Count Distinct in Solr

```
$ curl http://localhost:8983/solr/techproducts/query -d '
q=*:*&
json.facet={
  x : "unique(manu_exact)"    // manu_exact is the manufacturer indexed as a single string
}
'
```

# 纬度

## 日期
- Daily
```
gap: +1DAY
```
- Monthly
```
gap: +1MONTH
```
