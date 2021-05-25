#!/bin/bash

set -eo pipefail

xcodebuild -workspace GMAPP.xcworkspace \
            -scheme GMAPP \
            -destination platform=iOS\ Simulator,OS=14.5,name=iPhone\ 12 \
            clean test | xcpretty