# Autossh With Pre-command Injection

## Usage

Env-vars with prefix `PRE_COMMAND` are sorted and used to inject commands before autossh is invoked.

NB: you'll need to be _really_ sure you want to inject arbitrary shell commands like this!


```shell
docker run \
  --cap-add=NET_ADMIN \
  -e PRE_COMMAND_03='ping -c5 10.10.10.10' \
  -e PRE_COMMAND_02='ip route show' \
  -e PRE_COMMAND_01='ip route add 10.10.10.0/24 via 172.17.10.1' \
  threatpatrols/autossh -T user@10.10.10.10
```

## Source / Repo
* source: https://github.com/threatpatrols/docker-autossh
* repo: https://hub.docker.com/r/threatpatrols/autossh

## AutoSSH Project
* project: https://www.harding.motd.ca/autossh/
* docs: https://www.harding.motd.ca/autossh/README.txt
* Source: https://github.com/Autossh/autossh
