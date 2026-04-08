#!/usr/bin/env bash

# ================= [ declarations ] =================

GENERATOR_VERSION="sha256:f2054a5a7908ad81017d0f0839514ba5eab06ae628914ff71554d46fac1bcf7a" # v7.10.0

# shellcheck source=../tools/common.sh
source "$(dirname "$0")/../tools/common.sh"

function generate() {
  local root
  root="$(repo_root)"

  if ! command -v docker &>/dev/null; then
    error "docker not found."
    exit 1
  fi

  info "Generating Go server → generated/server"

  rm -rf "${root}/generated/server"
  mkdir -p "${root}/generated/server"

  docker run --rm \
    -v "${root}:/repo" \
    "openapitools/openapi-generator-cli@${GENERATOR_VERSION}" generate \
    --input-spec /repo/api/openapi.yaml \
    --generator-name go-server \
    --output /repo/generated/server \
    --additional-properties=packageName=homerapi \
    --additional-properties=outputAsLibrary=true

  info "Done."
}

function main() {
  generate
}

# ================= [  execution   ] =================

main "$@"
