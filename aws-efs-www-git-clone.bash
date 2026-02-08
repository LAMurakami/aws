#!/usr/bin/bash

#aws-lam-efs-www-git-clone.bash

if [ -z $2 ] ; then
  echo "Two arguments needed!"
  echo "Usage: $0 <repo> <keyName> [target]"
  exit 1;
fi

repo=$1
keyName=$2

if [ $3 ] ; then
  target=$3
else
  target='/var/www/'
fi

if test -f '/mnt/efs/aws-lam-full'; then
  origin1='git@ip6-localhost:'
else
  origin1='git@aws:'
fi

git clone $origin1${repo}.git $target$repo

cd $target$repo
git remote rename origin aws
git remote set-url aws git@aws:$repo
git checkout -b $keyName
git tag -a -m "AWS LAM Initialization for $keyName" b0-$keyName
