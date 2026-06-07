#!/bin/bash

cd "$(dirname "$0")" || exit 1

failed=0
for dir in */; do
  [[ "$dir" == "ignore/" ]] && continue

  find "$dir" -type f | while read -r file; do
    target="$HOME/${file#*/}"
    [[ -f "$target" ]] && rm "$target"
  done

  stow "$dir" -R || failed=1
done

exit $failed

