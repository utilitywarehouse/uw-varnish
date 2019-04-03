#!/bin/sh

shutdown() {
	log "Stopping"
	pkill varnishd
	log "Stopped varnishd $?"
	pkill varnishncsa
	log "Stopped varnishncsa $?"
	exit 0
}

log() {
	echo "`date +'%F %T'` $1"
}

trap 'shutdown' HUP INT QUIT KILL TERM

# Start varnish and log
log "Starting"
varnishd -pvcc_allow_inline_c=true -f /config/default.vcl -s malloc,${VARNISH_MEMORY} -t 5 -p default_grace=0 &
sleep 4

varnishncsa -F '%{X-Forwarded-For}i %u %{%d/%b/%Y:%T}t %U%q %s %D "%{User-Agent}i" %{Varnish:handling}x' -q 'RespStatus >= 400 or BerespStatus >= 400' &
log "Started"

#
wait ${!}
