#!/bin/sh

DOMAINS_BLACKLIST=/etc/domains-blacklist.txt

# domain blacklist
if [ -z "$CUSTOM_DOMAIN_BLACKLIST" ]; then
    echo "generate blacklist"
    cd /tmp/domains-blocklist
    /usr/local/bin/generate-domains-blocklist.py -c /tmp/domains-blocklist/domains-blocklist.conf -a /tmp/domains-blocklist/domains-allowlist.txt -r /tmp/domains-blocklist/domains-time-restricted.txt -o /etc/domains-blacklist.txt
else
    echo "use custom domain blacklist: $CUSTOM_DOMAIN_BLACKLIST"
    cp $CUSTOM_DOMAIN_BLACKLIST $DOMAINS_BLACKLIST
fi


echo "generate dnscrypt-proxy.conf"
# use logging and server options internally.
/usr/local/bin/generate-config.sh

echo "start dnscrypt-proxy"
dnscrypt-proxy -config /etc/dnscrypt-proxy.conf
