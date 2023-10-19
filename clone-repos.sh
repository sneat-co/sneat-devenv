#!/bin/zsh

go_repositories=("${(@f)$(./repos.sh)}")

for repo in "${go_repositories[@]}"; do
  git clone "https://github.com/${repo}" "../${repo#*/}"
done
