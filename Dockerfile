
# https://hub.docker.com/_/debian/tags
FROM debian:stable-slim

# Hello
LABEL maintainer="Nicholas de Jong <ndejong@threatpatrols.com>"
LABEL source="https://github.com/threatpatrols/docker-autossh"

# install prerequisites and autossh
RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y autossh iproute2 iputils-ping && \
    \
    apt-get clean && \
    apt-get autoremove -y

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
