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

RUN wget -q -P /tmp https://github.com/stecklars/dynamic-dns-netcup-api/archive/v2.0.tar.gz
RUN tar xvf /tmp/v2.0.tar.gz -C /tmp

RUN mkdir /netcup
RUN mv /tmp/dynamic-dns-netcup-api-2.0/* /netcup
RUN rm -R /tmp/v2.0.tar.gz /tmp/dynamic-dns-netcup-api-2.0

WORKDIR /netcup

COPY root/entrypoint /usr/local/sbin/entrypoint
RUN chmod +x /usr/local/sbin/entrypoint

ENTRYPOINT [ "/usr/local/sbin/entrypoint" ]
