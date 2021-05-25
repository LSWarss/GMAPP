#!/bin/bash

set -eo pipefail

cd GMAPP    -package; swift test --parallel; cd ..