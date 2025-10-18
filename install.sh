#!/bin/bash

cd "$(dirname $0)"

for dir in */; do
  # skip files in ignore/ (mac config files)
  if [[ "$dir" == "ignore/" ]]; then
    continue
  fi

  # remove config file if already exists
  find "$dir" -type f | while read file; do
    target="$HOME/${file#*/}"
    [[ -f "$target" ]] && rm "$target"
  done

  stow $dir -R
done