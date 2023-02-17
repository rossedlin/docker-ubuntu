FROM ubuntu:20.04

#
# Install Curl
#
RUN apt-get update; \
    apt install -y curl git openssh-client zip unzip jq; \
    rm -rf /var/lib/apt/lists/*;
