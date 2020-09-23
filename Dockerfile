FROM jenkins/ssh-agent:latest

## Configuration for Java development using Java 8

RUN \
    echo "Installing prerequisites" && \
    apt-get update && \
    apt-get install -y \
        curl \
        git \
        gradle \
        maven \
        vim \
        && \
    rm -fr /var/lib/apt/lists/* && \
    apt-get clean

ARG BUILD_DATE
ARG IMAGE_NAME
ARG IMAGE_VERSION
LABEL build-date="$BUILD_DATE" \
      description="Base image for all builder images" \
      summary="Simply creates the dev user building source code." \
      name="$IMAGE_NAME" \
      release="$IMAGE_VERSION" \
      version="$IMAGE_VERSION"
