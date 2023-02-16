FROM ubuntu:20.04

#
# Install Curl
#
RUN apt-get update; \
    apt install -y curl git openssh-client jq; \
    rm -rf /var/lib/apt/lists/*;
