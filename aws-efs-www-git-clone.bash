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

# The git repos are in the us-west-2 Oregon region
if [[ ${REGION} == 'us-west-2' ]]; then
  origin1='git@localhost:/mnt/efs/git/'
else
# If not in the us-west-2 Oregon region use the ssh to aws connection
  origin1='git@aws:/mnt/efs/git/'
fi

git clone $origin1$repo $target$repo

cd $target$repo
git remote rename origin aws
git remote set-url aws git@aws:$repo
git checkout -b $keyName
git tag -a -m "AWS LAM Initialization for $keyName" b0-$keyName
