#!/bin/bash
set -e

(cd android && fastlane version_bump)

git add android/app/build.gradle package.json
