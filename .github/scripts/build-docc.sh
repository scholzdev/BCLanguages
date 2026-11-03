#!/bin/bash

export LC_CTYPE=en_US.UTF-8

set -o pipefail && xcodebuild clean docbuild -scheme BCLanguages \
    -destination generic/platform=macos \
    OTHER_DOCC_FLAGS="--transform-for-static-hosting --hosting-base-path BCLanguages --output-path ./docs" | xcpretty