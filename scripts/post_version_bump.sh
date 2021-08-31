#!/bin/bash
set -e

git config --local user.email $USER_EMAIL
git config --local user.name $USER_NAME

git push && git push --tags
