#!/bin/bash
set -e
(cd android && gem install fastlane-plugin-increment_version_name)
(cd android && gem install fastlane-plugin-increment_version_code)
(cd android && gem install fastlane-plugin-load_json)

(cd android && bundle exec fastlane version_bump)

git config --local user.email $USER_EMAIL
git config --local user.name $USER_NAME

git add android/app/build.gradle
