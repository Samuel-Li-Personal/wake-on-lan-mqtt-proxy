#!/usr/bin/env bash

tag=$1
if [ "${tag}" == "" ]; then
  # current branch name
  branch_name=$(git rev-parse --abbrev-ref HEAD | sed -E 's/[^0-9A-Za-z\-_]/-/g')
  echo "Sanitised branch_name=${branch_name}"
  tag=${branch_name}
fi

docker push samuellihy/wake-on-lan-mqtt-proxy:${tag}