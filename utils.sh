#!/bin/bash

function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

function decode_jwt_payload() {
  local jwt="$1"
  local payload=$(echo "$jwt" | awk -F '.' '{print $2}')
  local decoded_payload=$(echo "$payload" | base64 -d)
  echo "$decoded_payload"
}

if [ -z "$2" ]
then
  echo "Error: need second argument"
  exit 1
fi

if [ "$1" = "urldecode" ]
then
  echo $(urldecode $(echo "$2"))
  exit 0
fi

if [ "$1" = "getjwtpayload" ]
then
  echo $(decode_jwt_payload $(echo "$2"))
  exit 0
fi

echo "Error: incorrect first argument. Pass either 'urldecode' or 'getjwtpayload'"
exit 1