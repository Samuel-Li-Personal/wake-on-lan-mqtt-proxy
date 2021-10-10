#!/usr/bin/env bash

source $(dirname $0)/env.sh

# current branch name
branch_name=$(get_sanitised_branch_name)
echo "Sanitised branch_name=${branch_name}"

# build for local OS
docker build -t "wake-on-lan-mqtt-proxy:${branch_name}" .

# cross platform build
# need to create new buildx builder instance first:
# e.g. docker buildx create --name builder-62326c95-5b2e-407e-9757-d3c48a14bdc0 --driver docker-container --buildkitd-flags --use
# docker buildx build --tag wake-on-lan-mqtt-proxy:feature-dockerise --platform linux/arm/v6 --file ./Dockerfile .