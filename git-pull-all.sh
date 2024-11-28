#!/bin/zsh

go_repositories=("${(@f)$(./repos.sh)}")

for repo in "${go_repositories[@]}"; do
  cd "../${repo#*/}" || exit 1
  pwd
  git pull || exit 1
done
