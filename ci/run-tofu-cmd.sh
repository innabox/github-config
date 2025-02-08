#!/bin/bash

tmpout=$(mktemp applyoutXXXXXX)
tmperr=$(mktemp applyerrXXXXXX)
trap 'rm -f "$tmpout" "$tmperr"' EXIT

tofu "$@" > "$tmpout" 2> "$tmperr"
exitcode=$?

if [[ -n "$GITHUB_ACTION" ]]; then
  echo "::group::stdout-${RANDOM}"
  cat "$tmpout"
  echo "::endgroup"

  echo "::group::stderr-${RANDOM}"
  cat "$tmperr"
  echo "::endgroup"
  if grep -q '^Error:' "$tmperr"; then
      {
        printf "## Errors\n"
        ./ci/markup-tofu-errors.sh < "$tmperr"
      } >> "$GITHUB_STEP_SUMMARY"
  fi
else
  cat "$tmpout"
  cat "$tmperr" >&2
fi

exit "$exitcode"
