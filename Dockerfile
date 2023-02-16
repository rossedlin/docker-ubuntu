FROM ubuntu:20.04

#
# Install Curl
#
RUN apt-get update; \
    apt install -y curl; \
    rm -rf /var/lib/apt/lists/*;
