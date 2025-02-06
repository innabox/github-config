#!/bin/bash

set -x

tofu fmt -no-color -check -diff "$@" > tofu.out 2>&1
res=$?
echo "RES: $res"

cat tofu.out

if grep -qi error tofu.out && [[ $res -eq 0 ]]; then
  echo SOMETHING IS WRONG
  exit 1
fi

exit $res
