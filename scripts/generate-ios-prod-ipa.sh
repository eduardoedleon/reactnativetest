#!/bin/bash
set -e

TARGET_PLATFORM='ios'
IOS_ASSETS_DST='ios'
IOS_OUTPUT_DIR='/tmp/fronde/mercury/globug/mobile-app/android/build/'
IOS_BUNDLE_OUTPUT='ios/globug/main.jsbundle'

[[ -z "$GITHUB_WORKSPACE" ]] && IOS_BASE_PATH="ios/" BASE_PATH="" \
|| IOS_BASE_PATH="${GITHUB_WORKSPACE}/ios/" BASE_PATH="${GITHUB_WORKSPACE}"

# Install dependencies
cd "$BASE_PATH"
rm -rf node_modules ios/Pods
cat .env.stage > .env
npm ci

cd "$IOS_BASE_PATH"
sudo gem install cocoapods-clean
pod deintegrate
pod install

# Generate bundle
cd "../"
react-native bundle --platform ${TARGET_PLATFORM} --dev false --entry-file index.js \
--bundle-output ${IOS_BUNDLE_OUTPUT} --assets-dest ${IOS_ASSETS_DST}
