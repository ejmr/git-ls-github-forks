#!/bin/sh
#
# git ls-github-forks
#
# Project: https://github.com/ejmr/git-ls-github-forks
# Author:  Eric James Michael Ritz
# License: GNU General Public License 3
#
######################################################################

API_URL="https://api.github.com"

# GitHub will reject requests that do not send the User-Agent header.
# They suggest using either the author name or the program name as the
# User-Agent.  We use the program name since other programmers may
# create forks.  We also include the implementation because in the
# future this program may exist in different programming languages.
VERSION="0.1.0"
USER_AGENT="git-ls-github-forks/$VERSION (/bin/sh)"

# Get the remote GitHub repository URL.  We use this later but at
# first we want to make sure it exists so that we know this repository
# exists on GitHub.
REPOSITORY_URL=$(git ls-remote --get-url)

# It is possible for git-ls-remote to fail for different reasons, so
# if that happens then we exit immediately.  We do not use the exit
# code of git-ls-remote.  However, failure will show the user the
# error message from Git.
if test "$?" -ne "0"
then
    exit 1
fi

# We want to send a request to
#
#     https://api.github.com/repos/OWNER/REPOSITORY/forks
#
# so here we obtain the user's GitHub name and the repository name to
# insert into $DATA_URL, which will be in the format shown above.
OWNER=$(git config --get github.user)
REPOSITORY=$(basename --suffix=".git" "$REPOSITORY_URL")
DATA_URL="$API_URL/repos/$OWNER/$REPOSITORY/forks"

# This is the template we give to the jq program in order to extract
# and display the URL for each fork.
JSON_QUERY=".[] | .git_url"

# Fetch the JSON data about forks from GitHub and extract all of the
# URLs for those forks, sending them to standard output.
curl --silent \
    --user-agent "$USER_AGENT" \
    "$DATA_URL" \
    | jq --raw-output --monochrome-output "$JSON_QUERY"

# Mission accomplished, so we exit successfully and then try to think
# of something actually productive to do as opposed to doing anything
# to this script.
exit 0
