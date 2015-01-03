#!/bin/bash

if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
   exec /usr/local/bin/shadowvpn $SHADOWVPN_OPTS "$@"
fi

exec "$@"
