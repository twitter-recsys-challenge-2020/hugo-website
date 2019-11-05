#!/bin/sh

set -e

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "Usage: `basename $0` [-h] [<commit message>]"
      exit 0
fi

echo "building website from themes/hugo-universal-theme/website/"
cd themes/hugo-universal-theme/website/
hugo
cd public
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

git push origin master
