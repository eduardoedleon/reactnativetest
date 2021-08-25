#!/bin/bash
set -e

git config --local user.email "bot@users.noreply.github.com"
git config --local user.name "github-actions-bot"
git push && git push --tags
