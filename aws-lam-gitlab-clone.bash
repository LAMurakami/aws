#!/usr/bin/bash

# aws-lam-gitlab-clone.bash

if [ -z $2 ] ; then
  echo "Two arguments needed!"
  echo "Usage: $0 <repo> <keyName> [target]"
  exit 1;
fi

REPO=$1
keyName=$2

if [ $3 ] ; then
  target=$3
else
  target='/var/www/'
fi

git clone https://gitlab.com/aws-lam/${REPO} $target${REPO}
cd $target${REPO}
git remote set-url origin git@gitlab.com:aws-lam/${REPO}
git remote add github git@github.com:LAMurakami/${REPO}
git remote add aws git@aws:${REPO}
git checkout -b $keyName
git tag -a -m "AWS LAM Initialization for $keyName" b0-$keyName
