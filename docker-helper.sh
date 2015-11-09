#!/bin/sh -e

docker_helper_stop_docker() {
  echo "[$(tput setaf 3)START$(tput setaf 9)] Stopping isolated Docker daemon" >&2
  stop-docker
  echo "[$(tput setaf 2)DONE $(tput setaf 9)] Stopping isolated Docker daemon" >&2
}

echo "[$(tput setaf 3)START$(tput setaf 9)] Starting isolated Docker daemon" >&2
start-docker
trap docker_helper_stop_docker EXIT
echo "[$(tput setaf 2)DONE $(tput setaf 9)] Starting isolated Docker daemon" >&2
