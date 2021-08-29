#!/bin/bash
set -e

[[ -z "$GITHUB_WORKSPACE" ]] && IOS_BASE_PATH="ios/" BASE_PATH="" \
|| IOS_BASE_PATH="${GITHUB_WORKSPACE}/ios/" BASE_PATH="${GITHUB_WORKSPACE}"

# Install dependencies
cd "$BASE_PATH"
npm ci

cd "$IOS_BASE_PATH"
if ! gem list '^cocoapods-clean$' -i > /dev/null 2>&1; then
  echo "Gem cocoapods-clean is not installed, please give root permission to install it now."
  sudo gem install cocoapods-clean
fi

/usr/local/bin/pod deintegrate
/usr/local/bin/pod install

# Ignoring changes make on the project after pod install
#git checkout -- globug.xcodeproj/project.pbxproj