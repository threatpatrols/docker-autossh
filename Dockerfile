
# https://hub.docker.com/_/debian/tags
FROM debian:stable

# Hello
LABEL maintainer="Nicholas de Jong <ndejong@threatpatrols.com>"
LABEL source="https://github.com/threatpatrols/docker-autossh"

# install prerequisites and autossh
RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y autossh && \
    \
    apt-get clean && \
    apt-get autoremove -y

# run as non-privileged user
USER 65534

ENTRYPOINT ["autossh"]
