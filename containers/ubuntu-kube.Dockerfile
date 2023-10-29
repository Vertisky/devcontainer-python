ARG BASE_VERSION=v1.2.1
ARG PYTHON_VERSION=latest

FROM etma/devcontainer-kube:ubuntu-${BASE_VERSION}
ARG VERSION
ARG COMMIT
ARG BUILD_DATE
ARG BASE_VERSION
ARG PYTHON_VERSION

LABEL \
    org.opencontainers.image.title="DevContainer for PYTHON" \
    org.opencontainers.image.description="Ubuntu PYTHON image for dev containers." \
    org.opencontainers.image.url="https://github.com/vertisky/devcontainers-python" \
    org.opencontainers.image.documentation="https://github.com/vertisky/devcontainers-python" \
    org.opencontainers.image.source="https://github.com/vertisky/devcontainers-python" \
    org.opencontainers.image.vendor="vertisky" \
    org.opencontainers.image.authors="etma@vertisky.com" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.version=$VERSION \
    org.opencontainers.image.revision=$COMMIT \
    org.opencontainers.image.created=$BUILD_DATE

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        software-properties-common build-essential \
        ca-certificates curl git jq
RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        python${PYTHON_VERSION} python${PYTHON_VERSION}-dev python${PYTHON_VERSION}-distutils \
        python3-pip python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
