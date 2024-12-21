
# https://hub.docker.com/_/debian/tags
FROM debian:stable-slim

# OCI Labels
LABEL org.opencontainers.image.title="Docker AutoSSH"
LABEL org.opencontainers.image.authors="Nicholas de Jong <ndejong@threatpatrols.com>"
LABEL org.opencontainers.image.source="https://github.com/threatpatrols/docker-autossh"

# install prerequisites and autossh
RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y autossh iproute2 iputils-ping && \
    \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
