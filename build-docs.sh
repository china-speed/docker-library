#!/bin/bash

rm -rf docs
mkdir -p docs
cp README.md docs/
echo "china-speed.org" >docs/CNAME
echo "site_name: '中国速度（为开发者加速）'
repo_url: https://github.com/china-speed/docker-library
edit_uri: edit/master/
nav:
    - 'China Speed': 'README.md'" >mkdocs.yml

mkdocs build --clean
