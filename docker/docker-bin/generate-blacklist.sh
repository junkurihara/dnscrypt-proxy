#!/bin/sh

git clone https://github.com/junkurihara/dnscrypt-proxy-blacklist.git /tmp/dnscrypt-proxy-blacklist
git clone https://github.com/junkurihara/experimental-crap-filter.git /tmp/experimental-crap-filter

cd /tmp/dnscrypt-proxy-blacklist/generator-config/
cat /tmp/experimental-crap-filter/experimental.txt >> ./domains-blacklist-local-additions.conf
/usr/local/bin/generate-domains-blocklist.py -c /tmp/dnscrypt-proxy-blacklist/generator-config/domains-blacklist.conf -a /tmp/dnscrypt-proxy-blacklist/generator-config/domains-whitelist.conf -r /tmp/dnscrypt-proxy-blacklist/generator-config/domains-time-restricted.conf > /etc/domains-blacklist.txt

rm -rf /tmp/dnscrypt-proxy-blacklist
rm -rf /tmp/experimental-crap-filter
