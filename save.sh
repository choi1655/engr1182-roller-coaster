#!/bin/zsh

# @file save.sh
# @author John Choi
# Generate readme and push to the git repo

# Generate readme
javac WriteReadme.java
java WriteReadme

# Commit and push to GitHub
git add .
if [[ $# == 0 ]]
then
	git commit -m "Saving"
else
	argument=$1
	git commit -m "$argument"
fi
git push

