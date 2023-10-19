#!/bin/zsh

go_repositories=("${(@f)$(./repos.sh)}")

for repo in "${go_repositories[@]}"; do
  gh repo clone "${repo}" "../${repo#*/}"
done
