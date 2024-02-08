#!/usr/bin/env sh

# ================= [ declarations ] =================

function info() {
  local msg="$1"
  echo -e "\e[34m[*]\e[0m ${msg}"
}

function error() {
  local msg="$1"
  echo -e "\e[31m[*]\e[0m ${msg}"
}

function load_props() {
  local env="$1"
  local script_dir=$(dirname "$0")
  local props_path="${script_dir}/${env}-properties.sh"
  if [[ ! -f "${props_path}" ]]; then
    error "Property file '${props_path}' does not exist. Make sure you went through setup steps from README."
    exit 1
  fi
  info "Loading properties from '${props_path}'."
  source ${props_path}
}

function check_required_props() {
  if [[ ! -v SENTRY_DSN ]]; then
    error "Property 'SENTRY_DSN' is required."
    exit 1
  fi
}

function run_app() {
  local env="$1"
  if [[ "${env}" == "prod" ]]; then
    info "Running 'flutter run --flavor prod --release -t lib/envs/prod.dart --dart-define SENTY_DSN=<value>'"
    flutter run --flavor prod --release -t lib/envs/prod.dart --dart-define SENTY_DSN=${SENTRY_DSN}
  elif [[ "${env}" == "dev" ]]; then
    info "Running 'flutter run --flavor dev -t lib/envs/dev.dart --dart-define SENTRY_DSN=<value>'"
    flutter run --flavor dev -t lib/envs/dev.dart --dart-define SENTRY_DSN=${SENTRY_DSN}
  else
    error "Unknown environment '${env}'."
    exit 1
  fi
}

function main() {
  info "starting app"
  if [[ $# -lt 1 ]]; then
    error "You need to specify an environment."
    error ""
    error "Usage:"
    error "$0 <env>"
    error "\t <env>: prod|dev"
    exit 1
  fi 
  local env="$1"
  info "Running '${env}' app."
  load_props "${env}"
  check_required_props
  run_app "${env}"
}

# ================= [  execution   ] =================

main "$@"