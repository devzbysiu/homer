#!/usr/bin/env bash

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
  # shellcheck disable=SC2155
  local script_dir=$(dirname "$0")
  local props_path="${script_dir}/${env}-properties.sh"
  if [[ ! -f "${props_path}" ]]; then
    error "Property file '${props_path}' does not exist. Make sure you went through setup steps from README."
    exit 1
  fi
  info "Loading properties from '${props_path}'."
  # shellcheck disable=SC1090
  source "${props_path}"
}

function run_app() {
  local env="$1"
  if [[ "${env}" == "prod" ]]; then
    info "Running 'flutter run --flavor prod --release -t lib/envs/prod.dart'"
    flutter run --flavor prod --release -t lib/envs/prod.dart
  elif [[ "${env}" == "dev" ]]; then
    info "Running 'flutter run --flavor dev -t lib/envs/dev.dart'"
    flutter run --flavor dev -t lib/envs/dev.dart
  else
    error "Unknown environment '${env}'."
    exit 1
  fi
}

function install_app() {
  local env="$1"
  if [[ "${env}" == "prod" ]]; then
    info "Building 'flutter build apk --release --flavor prod -t lib/envs/prod.dart'"
    flutter build apk --release --flavor prod -t lib/envs/prod.dart
    info "Installing the app"
    flutter install --release --flavor prod
  elif [[ "${env}" == "dev" ]]; then
    info "Building 'flutter build apk --debug --flavor dev -t lib/envs/dev.dart"
    flutter build apk --debug --flavor dev -t lib/envs/dev.dart
    info "Installing the app"
    flutter install --debug --flavor dev
  else
    error "Unknown environment '${env}'."
    exit 1
  fi
}

function main() {
  info "Starting app..."
  if [[ $# -lt 2 ]]; then
    error "You need to specify command and environment."
    error ""
    error "Usage:"
    error "$0 <cmd> <env>"
    error "\t <cmd>: run|install"
    error "\t <env>: prod|dev"
    exit 1
  fi

  local env="$2"
  load_props "${env}"

  local cmd="$1"

  case "${cmd}" in
  "run")
    info "Running '${env}' app."
    run_app "${env}"
    ;;
  "install")
    info "Installing '${env}' app."
    install_app "${env}"
    ;;
  *)
    error "Unknown command '${cmd}'."
    exit 1
    ;;
  esac
}

# ================= [  execution   ] =================

main "$@"
