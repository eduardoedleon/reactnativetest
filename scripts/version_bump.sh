#!/bin/bash
set -e

if [ -z "$1" ]
  then
    echo "Error: No version type supplied"
    exit 1
fi

npm version $1
(cd android && fastlane version_bump)

git add android/app/build.gradle package.json

git push && git push --tags
