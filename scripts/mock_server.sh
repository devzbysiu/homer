#!/usr/bin/env bash

# ================= [ declarations ] =================

PRISM_VERSION="sha256:65c9fa038e0e8ccd89078ccc7559c88596601b1ed8a55a6675bcc46abecd3859" # 5.12.0

# shellcheck source=../tools/common.sh
source "$(dirname "$0")/../tools/common.sh"

function mock() {
  local root
  root="$(repo_root)"

  if ! command -v docker &>/dev/null; then
    error "docker not found."
    exit 1
  fi

  info "Starting mock server on http://localhost:4010"

  docker run --rm \
    -v "${root}/api:/api" \
    -p 4010:4010 \
    "stoplight/prism@${PRISM_VERSION}" \
    mock --host 0.0.0.0 /api/openapi.yaml
}

function main() {
  mock
}

# ================= [  execution   ] =================

main "$@"
