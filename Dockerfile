FROM docker.io/library/alpine:3.22 AS build

RUN apk update && apk add build-base zlib-dev gnutls-dev pcre-dev make
ADD tt /root/tt
WORKDIR /root/tt/src
RUN ./configure && make -j$(nproc) && make install

FROM docker.io/library/alpine:3.22 AS runtime
RUN apk update && apk add tini gnutls pcre 
COPY --from=build /usr/local/bin/tt++ /usr/bin/tt++
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/bin/tt++"]
VOLUME /root/.tintin
