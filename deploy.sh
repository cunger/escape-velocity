#!/bin/sh

hugo gen chromastyles --style=algo static/css/highlight.css
# tokyonight-moon
# nord

hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

rm -r ../cunger.github.io/*
cp -r public/* ../cunger.github.io/

cd ../cunger.github.io

git add .

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

git commit -m "$msg"
git push origin master
