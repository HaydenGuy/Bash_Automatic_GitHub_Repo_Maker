#!/bin/bash

# Replace with your own username and access token
GITHUB_USERNAME="HaydenGuy"
ACCESS_TOKEN="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"

# Sets argument 1 as target directory if none given it sets to current directory
target_dir=${1:-.}

# Sets the GitHub repo name and commit message
read -p "Enter the name for your GitHub repo: " github_repo
read -p "Enter your initial commit message: " commit_message

# Change directory to target directory. If cd fails exit command is run
cd "$target_dir" || exit 1

# Create a new GitHub repository using the GitHub API
curl -u "$GITHUB_USERNAME:$ACCESS_TOKEN" https://api.github.com/user/repos -d '{"name":"'"$github_repo"'"}'

# Initiliase git and add everything (.) in the folder 
git init
git add .

# Commit message taken from read
git commit -m "$commit_message"

# Change the name of the branch to main
git branch -M main

# Add the Github repository URL
git remote add origin "git@github.com:$GITHUB_USERNAME/$github_repo.git"

# Push the files upstream (-u) to Github
git push -u origin main