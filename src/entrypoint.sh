#!/bin/bash

# Parameters
sourceFolder=$1
targetFolder=$2
githubBranchName=$3
githubUserName=$4
githubRepository=$5
githubAccessToken=$6

# Setup Git
git pull
git config --global user.email "sphinx-rdt-wiki-agent@email.com" && git config --global user.name "Sphinx-rdt-wiki-action Agent"

# Generate wiki
rm -rf $targetFolder
python3 -msphinx -M html $sourceFolder $targetFolder

# Push the changes to Github
cd $targetFolder
git config --global --add safe.directory /github/workspace
git add -f .
git commit --message "Automatic CI Documentation."
git push --quiet "https://$githubUserName:$githubAccessToken@github.com/$githubRepository.git" "HEAD:$githubBranchName"
