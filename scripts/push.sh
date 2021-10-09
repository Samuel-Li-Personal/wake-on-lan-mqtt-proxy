#!/usr/bin/env bash

source $(dirname $0)/env.sh

tag=$1
if [ "${tag}" == "" ]; then
  tag=$(get_sanitised_branch_name)
fi

docker tag wake-on-lan-mqtt-proxy:${tag} ${dockerhub_repo}/wake-on-lan-mqtt-proxy:${tag}
docker push ${dockerhub_repo}/wake-on-lan-mqtt-proxy:${tag}