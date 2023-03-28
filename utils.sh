#!/bin/bash

function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

function decode_jwt_payload() {
  local jwt="$1"
  local payload=$(echo "$jwt" | awk -F '.' '{print $2}')
  local decoded_payload=$(echo "$payload" | base64 -d)
  echo "$decoded_payload"
}

export -f urldecode
export -f decode_jwt_payload