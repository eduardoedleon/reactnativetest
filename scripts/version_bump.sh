#!/bin/bash
set -e

EXTRACTED_VERSION=$(awk -F \" '/"version": ".+"/ { print $4; exit; }' package.json)

export VERSION_CODE=$github.run_number
export VERSION_NAME="$EXTRACTED_VERSION-$github.run_number"

#(cd android && bundle exec fastlane version_bump)

git config --local user.email $USER_EMAIL
git config --local user.name $USER_NAME

git add android/app/build.gradle
