ARG BASE_VERSION=v1.2.1

FROM etma/devcontainer-kube:debian-${BASE_VERSION}
ARG VERSION
ARG COMMIT
ARG BUILD_DATE
ARG BASE_VERSION

LABEL \
    org.opencontainers.image.title="DevContainer for python" \
    org.opencontainers.image.description="Debian python image for dev containers." \
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

RUN curl -o anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh && \
    chmod +x anaconda.sh && bash anaconda.sh -b -p /opt/conda && \
    rm anaconda.sh

ENV PATH /opt/conda/bin:$PATH
