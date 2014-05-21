#!/usr/bin/env bash

set -ue

dir=$(cd $(dirname $0); pwd);

sudo docker run -v $dir:/app -t ${TAG:-linter} /app/runner.bash
