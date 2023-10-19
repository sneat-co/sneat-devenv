#!/bin/zsh

go_repositories=("${(@f)$(./repos.sh)}")

for repo in "${go_repositories[@]}"; do
  if test -f "../${repo#*/}/go.mod"; then
    cd "../${repo#*/}" || exit 1
    pwd
    go test ./... || exit 1
  fi
done
