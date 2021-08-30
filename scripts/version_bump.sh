#!/bin/bash
set -e

(cd android && bundle exec fastlane version_bump)

git config --local user.email $USER_EMAIL
git config --local user.name $USER_NAME

git add android/app/build.gradle
