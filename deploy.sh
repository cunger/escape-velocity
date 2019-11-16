#!/bin/sh

hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

cd ../cunger.github.io
rm -r *
cp -r ../escape-velocity/public/* ./

git add .

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

git push origin master
