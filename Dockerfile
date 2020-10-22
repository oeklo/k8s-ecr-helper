FROM alpine

ARG TZ="Asia/Kolkata"
ARG GLIBC_VER=2.32-r0
ARG GET_AWSCLI=https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip

RUN apk add --no-cache openssl \
                       openssh-client \
                       tzdata \
                       vim \
                       less \
                       curl \
                       bash \
                       jq \
                       zip \
                       unzip \
                       git \
                       ca-certificates \
                       make \
                       binutils
# Patch GLIBC
RUN curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub && \
    curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk && \
    curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk && \
    curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-i18n-${GLIBC_VER}.apk && \
    apk add --no-cache glibc-${GLIBC_VER}.apk glibc-bin-${GLIBC_VER}.apk glibc-i18n-${GLIBC_VER}.apk

RUN curl -sL ${GET_AWSCLI} -o awscliv2.zip && \
    unzip awscliv2.zip && \
    aws/install
#clean up    
RUN    rm -rf \
        awscliv2.zip \
        aws \
        /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
        /usr/local/aws-cli/v2/*/dist/awscli/examples \
        glibc-${GLIBC_VER}.apk \
        glibc-bin-${GLIBC_VER}.apk && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apk upgrade --purge && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "/usr/local/bin/aws" ]