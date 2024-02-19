#!/usr/bin/bash

#aws-lam-efs-www-git-clone.bash

if [ -z $2 ] ; then
  echo "Two arguments needed!"
  echo "Usage: $0 <repo> <keyName>"
  exit 1;
fi

repo=$1
keyName=$2

  origin1='aws:/mnt/efs/git/'

git clone $origin1$repo /var/www/$repo
cd /var/www/$repo
git checkout -b $keyName
