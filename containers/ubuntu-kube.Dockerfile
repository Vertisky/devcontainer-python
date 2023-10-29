ARG BASE_VERSION=v1.2.1
ARG PYTHON_VERSION=3.9

FROM etma/devcontainer-python:ubuntu-kube-base
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


ENV PATH /opt/conda/bin:/opt/conda/envs/py${PYTHON_VERSION}/bin:$PATH

RUN conda create -n py${PYTHON_VERSION} python=${PYTHON_VERSION} \
    && conda clean --all --yes \
    && echo "conda activate py${PYTHON_VERSION}" >> ~/.profile

ENV PATH /opt/conda/envs/py${PYTHON_VERSION}/bin:$PATH


