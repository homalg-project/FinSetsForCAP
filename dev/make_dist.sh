#!/bin/bash

set -e

cp dev/.release .

../ReleaseTools/release-gap-package --skip-existing-release $@
