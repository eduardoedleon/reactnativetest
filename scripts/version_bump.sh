#!/bin/bash
set -e

EXTRACTED_VERSION=$(awk -F \" '/"version": ".+"/ { print $4; exit; }' package.json)

export VERSION_CODE=$github.run_number
export VERSION_NAME="$EXTRACTED_VERSION-$github.run_number"

git config --local user.email $USER_EMAIL
git config --local user.name $USER_NAME

if ["$PLATFORM_OS" == "ios"]
then
  cd "${GITHUB_WORKSPACE}/ios/"
  agvtool new-marketing-version "$VERSION_NAME"
  agvtool new-version -all "$VERSION_CODE"
fi
