#!/usr/bin/env sh

mkdir -p /etc/letsencrypt/live

if [ ! -f /etc/letsencrypt/live/last_modified ]; then
    echo "-" > /etc/letsencrypt/live/last_modified
fi

LAST_MODIFIED=`cat /etc/letsencrypt/live/last_modified`

while true
do
    if [ "`cat /etc/letsencrypt/live/last_modified`" != "${LAST_MODIFIED}" ]; then
        LAST_MODIFIED=`cat /etc/letsencrypt/live/last_modified`
        echo "Certs modified, reloading nginx";
        /install-certs.sh; /reload.sh
    fi
    sleep 30
done