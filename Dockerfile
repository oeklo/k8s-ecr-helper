FROM alpine:3.20

COPY refresh.sh /opt

RUN --mount=type=cache,target=/var/cache/apk apk add \
    aws-cli \
    kubectl

CMD /opt/refresh.sh
