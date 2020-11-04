#!/bin/bash

set -e

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

swift build --package-path "${SCRIPTPATH}" -c release
install -v "${SCRIPTPATH}/.build/release/imgurr" "/usr/local/bin/imgurr"
