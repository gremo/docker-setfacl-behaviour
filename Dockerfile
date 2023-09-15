FROM alpine
SHELL ["/bin/ash", "-euxo", "pipefail", "-c"]

RUN apk add --no-cache acl; \
    adduser -D -H www-data -G www-data
