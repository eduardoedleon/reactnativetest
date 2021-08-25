#!/bin/bash
set -e
(cd android && gem install fastlane-plugin-firebase_app_distribution)
(cd android && gem install fastlane-plugin-increment_version_name)
(cd android && gem install fastlane-plugin-increment_version_code)
(cd android && gem install fastlane-plugin-load_json)

(cd android && bundle exec fastlane version_bump)

git add android/app/build.gradle package.json
