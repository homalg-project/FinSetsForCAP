#!/bin/bash

set -e

./dev/release-gap-package --skip-existing-release --release-script dev/.release
