
FROM alpine:latest

MAINTAINER caligari@treboada.net

EXPOSE 8118

RUN apk --no-cache add privoxy 

COPY config /etc/privoxy/config

RUN chown privoxy:privoxy /etc/privoxy/config

VOLUME /etc/privoxy

CMD /usr/sbin/privoxy --no-daemon --user privoxy.privoxy /etc/privoxy/config


