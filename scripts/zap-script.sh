#!/bin/bash
set -euo pipefail

report_dir="${RUNNER_TEMP:?}/zap-report"
install -d -m 0777 "$report_dir"

docker run --rm \
  --volume "$report_dir:/zap/wrk:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
  -t 'https://narmi924.github.io/bitcoin-order-app/' \
  -l PASS -I -r zap_baseline_report.html
