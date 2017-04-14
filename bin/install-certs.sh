#!/usr/bin/env sh

set -e

# Install combined certificates for HAproxy.
if [[ -n "$(ls -A /etc/letsencrypt/live/)" ]]; then
	rm -rf /etc/nginx/conf.d/ssl*
	for DIR in /etc/letsencrypt/live/*; do
	    if [ "${DIR}" == "/etc/letsencrypt/live/last_modified" ]; then
            continue
        fi
        DOMAIN=`basename ${DIR}`
        COUNT=`echo ${DOMAIN}| tr -cd . | wc -c`

        if [ "$COUNT" -ne 1 ]; then
            continue
        fi

        NEWFILENAME=/etc/nginx/conf.d/ssl_${DOMAIN}.conf
        cp domain.conf.tpl ${NEWFILENAME}
        sed -i -- "s/\[\[domain\]\]/${DOMAIN}/g" ${NEWFILENAME}
	done
fi