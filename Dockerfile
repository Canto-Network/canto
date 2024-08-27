FROM golang:1.21 AS build-env

WORKDIR /go/src/github.com/canto/canto

COPY . .

RUN make build

FROM debian:12-slim

WORKDIR /root

COPY --from=build-env /go/src/github.com/canto/canto/build/cantod /usr/bin/cantod

EXPOSE 26656 26657 1317 9090

CMD ["cantod"]
