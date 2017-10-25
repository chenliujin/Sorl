
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

# 维度 

## 日期
- HOUR
```
gap: +1HOUR
```
- Daily
```
gap: +1DAY
```
- Monthly
```
gap: +1MONTH
```
- YEAR
```
	type: range,
	field: payment_time,
	start: '2010-01-01T00:00:00Z',
	end: '2017-01-01T23:59:59Z',
	gap: "%2B1YEAR" //+1YEAR, Postman 用 %2B1YEAR，curl 用 +1YEAR
```

# 参考文献
- [JSON Facet API](http://yonik.com/json-facet-api/)
