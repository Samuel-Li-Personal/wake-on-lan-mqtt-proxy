#!/usr/bin/env bash

source $(dirname $0)/env.sh

# current branch name
branch_name=$(get_sanitised_branch_name)
echo "Sanitised branch_name=${branch_name}"

docker build -t "wake-on-lan-mqtt-proxy:${branch_name}" .

if [ "${branch_name}" == "master" ]; then
  docker tag wake-on-lan-mqtt-proxy:${branch_name} ${dockerhub_repo}/wake-on-lan-mqtt-proxy:latest
fi