#!/bin/bash

tmpout=$(mktemp applyoutXXXXXX)
tmperr=$(mktemp applyerrXXXXXX)
trap 'rm -f "$tmpout" "$tmperr"' EXIT

if ! tofu fmt -check -diff -no-color -recursive > "$tmpout" 2> "$tmperr"; then
  if [[ -n "$GITHUB_ACTION" ]]; then
    if [[ -s "$tmperr" ]]; then
      {
      printf "## Errors\n"
      ./ci/markup-tofu-errors.sh < "$tmperr"
      } >> "$GITHUB_STEP_SUMMARY"
    fi
    if [[ -s "$tmpout" ]]; then
      {
      printf "## Changes\n"
      printf "> [!WARNING]\n> There are formatting problems that must be addressed.\n\n"
      echo '```'
      cat "$tmpout"
      echo '```'
      } >> "$GITHUB_STEP_SUMMARY"
    fi
  fi
  tofu fmt -diff -recursive
  exit 1
fi
