ARG BASE_VERSION=v1.2.1
ARG PYTHON_VERSION=latest

FROM etma/devcontainer-kube:alpine-${BASE_VERSION}
ARG VERSION
ARG COMMIT
ARG BUILD_DATE
ARG BASE_VERSION
ARG PYTHON_VERSION

LABEL \
    org.opencontainers.image.title="DevContainer for python" \
    org.opencontainers.image.description="alpine python image for dev containers." \
    org.opencontainers.image.url="https://github.com/vertisky/devcontainers-python" \
    org.opencontainers.image.documentation="https://github.com/vertisky/devcontainers-python" \
    org.opencontainers.image.source="https://github.com/vertisky/devcontainers-python" \
    org.opencontainers.image.vendor="vertisky" \
    org.opencontainers.image.authors="etma@vertisky.com" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.version=$VERSION \
    org.opencontainers.image.revision=$COMMIT \
    org.opencontainers.image.created=$BUILD_DATE

RUN apk add --no-cache \
        python3 python3-dev py3-pip py3-venv \
        build-base ca-certificates curl \
        git jq libffi-dev openssl-dev \
        openssh-client tzdata zlib-dev \
    && pip3 install --upgrade pip \
    && rm -rf /var/cache/apk/*
