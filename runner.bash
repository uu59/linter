#!/usr/bin/env bash

set -ue

cd /app
bundle
bundle exec ruby ./app.rb &
ngrok 4567
