module github.com/jedisct1/dnscrypt-proxy

go 1.13

require (
	github.com/BurntSushi/toml v0.3.1
	github.com/VividCortex/ewma v1.1.1
	github.com/agl/ed25519 v0.0.0-20170116200512-5312a6153412
	github.com/coreos/go-systemd v0.0.0-20190719114852-fd7a80b32e1f
	github.com/dchest/safefile v0.0.0-20151022103144-855e8d98f185
	github.com/facebookgo/atomicfile v0.0.0-20151019160806-2de1f203e7d5 // indirect
	github.com/facebookgo/pidfile v0.0.0-20150612191647-f242e2999868
	github.com/hashicorp/go-immutable-radix v1.1.0
	github.com/hashicorp/golang-lru v0.5.3
	github.com/jedisct1/dlog v0.0.0-20190909160351-692385b00b84
	github.com/jedisct1/go-clocksmith v0.0.0-20190707124905-73e087c7979c
	github.com/jedisct1/go-dnsstamps v0.0.0-20190803222545-08225c1155d6
	github.com/jedisct1/go-minisign v0.0.0-20190909160543-45766022959e
	github.com/jedisct1/xsecretbox v0.0.0-20190909160646-b731c21297f9
	github.com/k-sone/critbitgo v1.2.0
	github.com/kardianos/service v1.0.0
	github.com/miekg/dns v1.1.16
	golang.org/x/crypto v0.0.0-20190909091759-094676da4a83
	golang.org/x/net v0.0.0-20190909003024-a7b16738d86b
	golang.org/x/sys v0.0.0-20190909082730-f460065e899a
	gopkg.in/natefinch/lumberjack.v2 v2.0.0
	gopkg.in/yaml.v2 v2.2.2 // indirect
)
