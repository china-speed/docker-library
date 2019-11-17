#!/bin/bash
set -e

rm -rf .subsplit
main_repo_url="$(git config --get remote.origin.url)"
git subsplit init "$(git config --get remote.origin.url)"
git subsplit update
for d in */ ; do
  dir_name=${d%/}
  repo_url=${main_repo_url//\.git/-$dir_name}
  desc='[READ ONLY] auto split from china-speed/docker-library'
  hub create -d "$desc" "$repo_url"
  git subsplit publish \
    "$dir_name":"$repo_url" \
    --heads=master \
    --no-tags
done
