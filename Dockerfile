FROM ubuntu:20.04

#
# Install Core
#
RUN apt update; \
    apt --no-install-recommends install -y curl git openssh-client zip unzip jq; \
    rm -rf /var/lib/apt/lists/*;

#
# Add Docker
#
RUN apt update; \
    apt --no-install-recommends install -y apt-transport-https ca-certificates gnupg-agent; \
    DEBIAN_FRONTEND=noninteractive apt --no-install-recommends install -y tzdata; \
    apt --no-install-recommends install -y software-properties-common; \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -; \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"; \
    apt update; \
    apt --no-install-recommends install -y docker-ce docker-ce-cli containerd.io; \
    rm -rf /var/lib/apt/lists/*; \
    docker -v || exit 1; \
    docker compose -v || exit 1;

#
# Add Docker Compose
#
RUN curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '(?<="tag_name": ")[^"]*')/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose; \
    chmod +x /usr/local/bin/docker-compose; \
    docker-compose -v || exit 1;
