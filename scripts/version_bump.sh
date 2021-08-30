#!/bin/bash
set -e
gem install fastlane-plugin-firebase_app_distribution
gem install fastlane-plugin-increment_version_name
gem install fastlane-plugin-increment_version_code
gem install fastlane-plugin-load_json

bundle exec fastlane version_bump

git config --local user.email $USER_EMAIL
git config --local user.name $USER_NAME

git add app/build.gradle ../package.json
