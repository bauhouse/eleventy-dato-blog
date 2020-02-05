#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e3a181f1bed2b001beb1ab5/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e3a181f1bed2b001beb1ab5
curl -s -X POST https://api.stackbit.com/project/5e3a181f1bed2b001beb1ab5/webhook/build/ssgbuild > /dev/null
npm install && npm run build
curl -s -X POST https://api.stackbit.com/project/5e3a181f1bed2b001beb1ab5/webhook/build/publish > /dev/null
