#!/bin/bash

# credit: https://stackoverflow.com/questions/7555837/publish-jekyll-generated-to-gh-pages-and-not-overwrite-the-git-in-site

# Push source branch
git checkout source
git add -A
git commit
git push origin source

# Push master branch
jekyll
git checkout master
git rm -qr .
cp -r _site/. .
rm -r _site
git add -A
git commit
git push origin master
