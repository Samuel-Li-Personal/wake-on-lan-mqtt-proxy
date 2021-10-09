#!/usr/bin/env bash

source $(dirname $0)/env.sh

tag=$1
repo=$2
if [ "${tag}" == "" ]; then
  tag=$(get_sanitised_branch_name)
fi


if [ "${repo}" == "" ]; then
  # use local image
  repo=""
else
  # append '/' to repo name
  repo=$(echo ${repo} | sed -E "s/\/*$/\//")
fi

image="${repo}wake-on-lan-mqtt-proxy:${tag}"
echo "Running ${image}"

docker run \
  --rm -t \
  --mount type=bind,source="$(pwd)",target=/app/config,readonly \
  -e PYTHONUNBUFFERED=0 \
  ${image}