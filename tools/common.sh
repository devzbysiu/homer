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

function repo_root() {
  cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd
}
