#!/usr/bin/bash

# aws-lam-gitlab-clone.bash

if [ -z $2 ] ; then
  echo "Two arguments needed!"
  echo "Usage: $0 <repo> <keyName>"
  exit 1;
fi

REPO=$1
keyName=$2

git clone https://gitlab.com/aws-lam/${REPO} /var/www/${REPO}
cd /var/www/${REPO}
git remote set-url origin git@gitlab.com:aws-lam/${REPO}
git remote add github git@github.com:LAMurakami/${REPO}
git remote add ak20 git@ak20:${REPO}
git checkout -b $keyName
