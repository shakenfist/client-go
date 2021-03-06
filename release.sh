#!/bin/bash -e

# Release a specified version of Shaken Fist

echo "--- Determine verison number ---"
PREVIOUS=`git tag | egrep "^v" | sort -n | tail -1 | sed 's/^v//'`

echo
echo -n "What is the version number (previous was $PREVIOUS)? "
read VERSION

echo "--- Setup ---"
echo "Do you want to apply a git tag for this release (yes to tag)?"
read TAG
set -x

if [ "%$TAG%" == "%yes%" ]
then
  git tag -s "v$VERSION" -m "Release v$VERSION"
  git push origin "v$VERSION"
fi
