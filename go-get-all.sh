#!/bin/zsh

go_repositories=("${(@f)$(./repos.sh)}")

for repo in "${go_repositories[@]}"; do
  if test -f "../${repo#*/}/go.mod"; then
    cd "../${repo#*/}" || exit 1
    pwd
    go get ./... || exit 1
  else
    echo "The '../${repo#*/}' has no 'go.mod' file"
  fi
done
