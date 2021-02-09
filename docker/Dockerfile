FROM golang:1-alpine as build

LABEL maintainer "Jun Kurihara <kurihara@ieee.org>"

COPY . /go/src/dp/

RUN cd /go/src/dp/dnscrypt-proxy && \
    CGO_ENABLED=0 GOOS=linux go install -a -ldflags '-s -w -extldflags "-static"' -v ./...

FROM alpine:latest

RUN apk --no-cache add ca-certificates python3 git

COPY --from=build /go/bin/dnscrypt-proxy /usr/local/bin/dnscrypt-proxy
COPY --from=build /go/src/dp/utils/generate-domains-blocklist/generate-domains-blocklist.py /usr/local/bin/generate-domains-blocklist.py
COPY --from=build /go/src/dp/utils/generate-domains-blocklist /tmp/domains-blocklist
COPY --from=build /go/src/dp/docker/docker-bin/* /usr/local/bin/

RUN chmod 755 /usr/local/bin/*

VOLUME /config
VOLUME /var/log/dnscrypt-proxy

EXPOSE 53/tcp 53/udp

CMD ["/usr/local/bin/start.sh"]
