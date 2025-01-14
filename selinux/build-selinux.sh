#!/bin/sh
# Copyright 2019 Red Hat Inc.
# Copyright 2022 Collabora Ltd.
# SPDX-License-Identifier: LGPL-2.1-or-later

set -eu

TMP=$(mktemp -d selinux-build-XXXXXX)
output="$1"
shift
cp -- "$@" "$TMP/"

make -C "$TMP" -f /usr/share/selinux/devel/Makefile hirte.pp
bzip2 -9 "$TMP/hirte.pp"
cp "$TMP/hirte.pp.bz2" "$output"
rm -fr "$TMP"