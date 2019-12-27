#!/usr/bin/env bash
set -euxo pipefail

if ! command -v base16-builder >/dev/null 2>&1; then
    echo "base16-builder is not installed; install nodejs then:"
    echo "  npm install -g base16-builder"
    exit 1
fi

rm -rf mate-theme-scripts/*
for scheme in schemes/*.yml ; do
    base=$(basename "$scheme")
    for template in templates/*.ejs ; do
        type=$(basename "$template")
        base16-builder -t "$template" -s "$scheme" > mate-theme-scripts/"${base%%.*}"-"${type%%.*}".sh
    done
done
chmod a+x mate-theme-scripts/*.sh
