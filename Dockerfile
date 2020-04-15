FROM php:cli-alpine

ENV	TZ=Europe/Berlin \
	FREQUENCY="*/5 * * * *" \
	CUSTOMERNR=12345 \
	APIKEY=abcdefghijklmnopqrstuvwxyz \
	APIPASSWORD=abcdefghijklmnopqrstuvwxyz \
	DOMAIN=mydomain.com \
	HOST=server \
	USE_IPV6=false \
	CHANGE_TTL=true \
	APIURL=https://ccp.netcup.net/run/webservice/servers/endpoint.php?JSON

RUN apk update
RUN apk add --no-cache bash tzdata wget

COPY netcup /netcup

WORKDIR /netcup

COPY root/entrypoint /usr/local/sbin/entrypoint
RUN chmod +x /usr/local/sbin/entrypoint

ENTRYPOINT [ "/usr/local/sbin/entrypoint" ]
