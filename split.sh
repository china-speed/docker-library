#!/bin/bash
set -e

rm -rf .subsplit
remote_origin_url="$(git config --get remote.origin.url)"
git subsplit init "$remote_origin_url"
git subsplit update
for d in */ ; do
  dir_name=${d%/}
  repo_url=${remote_origin_url/\.git/-$dir_name\.git}
  repo_uri=$(echo "${repo_url#*:}" | cut -d'.' -f1)
  desc='[READ ONLY] auto split from docker-library'
  hub create -d "$desc" "$repo_uri"
  git subsplit publish \
    "$dir_name":"$repo_url" \
    --heads=master \
    --no-tags
done
