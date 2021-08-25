#!/bin/bash
set -e

(cd android && bundle exec fastlane version_bump)

git add android/app/build.gradle package.json
