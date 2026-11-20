#!/bin/bash
set -euo pipefail

status=0
jshint --exclude="node_modules/" --reporter=unix . > JSHint-report || status=$?

case "$status" in
  0) printf '%s\n' 'JSHint found no issues.' > JSHint-report ;;
  2) test -s JSHint-report ;;
  *) exit "$status" ;;
esac
