# docker-netcup-dyndns

Docker Image to Update DynDNS on Netcup  

Documentation from the Creator of the PHP Script:  

https://github.com/stecklars/dynamic-dns-netcup-api  

## Environment Variables

| ENV | Default |
| --- | ---|
| TZ | Europe/Berlin |
| ENV FREQUENCY | */5 * * * * |
| CUSTOMERNR | 12345 |
| APIKEY | abcdefghijklmnopqrstuvwxyz |
| APIPASSWORD | abcdefghijklmnopqrstuvwxyz |
| DOMAIN | mydomain.com |
| HOST | server |
| USE_IPV6 | false |
| CHANGE_TTL | true |
| APIURL | https://ccp.netcup.net/run/webservice/servers/endpoint.php?JSON |
