#!/bin/sh

CONFFILE=/etc/privoxy/config
PIDFILE=/var/run/privoxy.pid


if [ ! -f "${CONFFILE}" ]; then
	echo "Configuration file ${CONFFILE} not found!"
	exit 1
fi

if [ "x$1" != "x" ]; then
    SOCKS5_IPPORT=$1
    sed -i "s,^.*forward-socks5t.*9050.*$,forward-socks5t   /               $SOCKS5_IPPORT .," $CONFFILE
    echo "Translate the socks5 service at $SOCKS5_IPPORT"
fi

/usr/sbin/privoxy --no-daemon --pidfile "${PIDFILE}" "${CONFFILE}"

