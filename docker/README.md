# docker-dnscrypt-proxy

A simple dns proxy server via dnscrypt-proxy

## Build and start local dnscrypt-proxy server

```shell
$ docker build -t jqtype/dnscrypt-proxy-blacklist . # necessary if build from source
$ docker-compose up -d
```

Now you can connect dnscrypt-proxy through 127.0.0.1:53

## (Optional) Configuration

You can configure remote DNS server list, custom blacklist of domains, and logging options. To this end, edit `dnscrypt.env` like the following.

```
## (optional) dns server names
## the default servers are cloudflare and cloudflare-ipv6

# SERVER_NAMES=cloudflare,cloudflare-ipv6


###################
## (optional) domain blacklist
## the default blacklist is generated with https://github.com/junkurihara/dnscrypt-proxy-blacklist,
## which is customized for japanese websites.
## this option is for custom domain blacklist under your preference.

# CUSTOM_DOMAIN_BLACKLIST=/custom/domains-blacklist.txt


###################
## (optional) domain whitelist
## the default blacklist is null.
## this option is for custom domain whitelist under your preference.

# CUSTOM_DOMAIN_WHITELIST=/custom/domains-whitelist.txt


###################
## (optional) forwarding rule
## the default forwarding rule is null.
## this option is for custom dns forwarding rule under your preference.

# CUSTOM_FORWARDING_RULE=/custom/forwarding-rule.txt


###################
## (optional) cloaking list
## the default cloaking list is null.
## this option is for custom domain cloaking rule under your preference.

# CUSTOM_CLOAKING_RULE=/custom/cloaking-rule.txt


###################
## (optional) logging
## logging is enabled only if each option is explicitly specified as true.
## otherwise, i.e., false or non-specified, no logging is enabled.
## namely, the default is no logging.

QUERY_LOG=true
BLOCK_LOG=true
NX_LOG=true
```


## Generating blacklist

The default blacklist is based on [280blocker domain list](https://280blocker.net/files/280blocker_domain.txt). At the initialization phase, the container automatically creates an aggregated domain list at https://github.com/junkurihara/dnscrypt-proxy-blacklist. In this docker file, the aggregated domain list can be generated through

```shell
$ docker exec dnscrypt-proxy /bin/sh -c 'generate-blacklist.sh'
```

and the generated blacklist is at `/etc/generated-blacklist.txt`. 
