FROM alpine:latest

RUN apk --no-cache add privoxy 
ADD privoxy-start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/privoxy-start.sh

ADD config default.action default.filter match-all.action user.action user.filter /etc/privoxy/
RUN chown privoxy:privoxy /etc/privoxy/*
RUN chmod 755 /etc/privoxy/*

CMD ["privoxy-start.sh"]

EXPOSE 8118
