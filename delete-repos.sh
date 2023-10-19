#!/bin/zsh

go_repositories=("${(@f)$(./repos.sh)}")

for repo in "${go_repositories[@]}"; do
  rm -rf "../${repo#*/}" || exit 1
done
