#!/bin/bash
set -e
(cd android && gem install fastlane-plugin-firebase_app_distribution --user-install)
(cd android && gem install fastlane-plugin-increment_version_name --user-install)
(cd android && gem install fastlane-plugin-increment_version_code --user-install)
(cd android && gem install fastlane-plugin-load_json --user-install)

(cd android && fastlane version_bump)

git add android/app/build.gradle package.json
