#!/bin/sh
# Deterministic release build on top of the Makefile: freezes the
# source date so repeated builds of the same tree compare byte for
# byte, then prints the output hashes. Override with SOURCE_DATE_EPOCH.
set -e
: "${SOURCE_DATE_EPOCH:=1755916800}" # 2026-08-23, the 3284ccd fork point
export SOURCE_DATE_EPOCH
make ${CC:+CC="$CC"} all QUIET=1
echo "--- sha256 ---"
sha256sum ../../*.dll ../../test_plugin.asi 2>/dev/null || true
