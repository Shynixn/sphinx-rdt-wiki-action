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
git add -f $targetFolder
git commit --message "Automatic CI Documentation."
echo "https://$githubUserName:$githubAccessToken@github.com/$githubRepository.git"
echo "HEAD:$githubBranchName"
git push --quiet "https://$githubUserName:$githubAccessToken@github.com/$githubRepository.git" "HEAD:$githubBranchName"
