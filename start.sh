#!/bin/bash

if [[ $# -lt 1 ]] || [[ "$1" == "-c" ]]; then
   exec /usr/local/bin/shadowvpn $SHADOWVPN_OPTS "$@"
fi

exec "$@"
