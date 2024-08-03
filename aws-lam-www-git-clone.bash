#!/usr/bin/bash

#aws-lam-www-git-clone.bash

if [ -z $2 ] ; then
  echo "At least two arguments needed!"
  echo "Usage: $0 <repo> <keyName> [private]"
  exit 1;
fi

repo=$1
keyName=$2

if [ -z $3 ] ; then # default is the public origin (my public github repos)
  origin1='https://github.com/LAMurakami/'
  origin2='git@github.com:LAMurakami/'
else
  origin1='/mnt/efs/git/'
  origin2='git@ak20:'
fi

git clone $origin1$repo /var/www/$repo
cd /var/www/$repo
git remote set-url origin $origin2$repo
[ -z $3 ] &&  git remote add ak20 git@ak20:$repo
git checkout -b $keyName
git tag -a -m "AWS LAM Initialization for $keyName" b0-$keyName
