#!/usr/bin/env bash

source $(dirname $0)/env.sh

tag=$1
if [ "${tag}" == "" ]; then
  tag=$(get_sanitised_branch_name)
fi

docker run \
  --rm -t \
  --mount type=bind,source="$(pwd)",target=/app/config,readonly \
  -e PYTHONUNBUFFERED=0 \
  wake-on-lan-mqtt-proxy:${tag}