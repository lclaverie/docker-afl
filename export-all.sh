#!/bin/bash

BASEDIR=$(cd "$(dirname "$0")" && pwd)

for file in ${BASEDIR}/export-scripts/*; do $file; done

exit 0
