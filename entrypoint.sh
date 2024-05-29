#!/bin/bash

set -e

# Exec any PRE_COMMAND defined via env-vars
while IFS= read -r pre_command_exec || [[ -n $pre_command_exec ]]; do
  if [ -n "${pre_command_exec}" ]; then
    if [[ "${pre_command_exec}" = *base64* ]]; then
      echo "PRE_COMMAND: >> [command redacted because 'base64' found]"
    else
      echo "PRE_COMMAND: >> ${pre_command_exec}"
    fi
    ${pre_command_exec}
    echo "==="
  fi
done < <(printf '%s' "$(env | sort | grep ^PRE_COMMAND | cut -d'=' -f2-)")

autossh "${@}"
