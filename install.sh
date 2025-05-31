#!/bin/bash

cd "$(dirname $0)"

for dir in */; do
  if [[ "$dir" == "ignore/" ]]; then
    continue
  fi

  stow $dir -R
done