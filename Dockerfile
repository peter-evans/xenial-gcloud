FROM ubuntu:xenial

MAINTAINER Peter Evans <pete.evans@gmail.com>

# Let the container know that there is no TTY
ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get -y update && apt-get install -y -qq --no-install-recommends \
    wget \
    unzip \
    python \
    ca-certificates

# Install the Google Cloud SDK
ENV HOME /
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip \
 && google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc \
 # Disable gcloud components update check
 && google-cloud-sdk/bin/gcloud config set --installation component_manager/disable_update_check true

ENV PATH /google-cloud-sdk/bin:$PATH
