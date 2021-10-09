#!/usr/bin/env bash

source $(dirname $0)/env.sh

tag=$(get_sanitised_branch_name)
echo $tag