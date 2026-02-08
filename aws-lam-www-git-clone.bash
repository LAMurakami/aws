#!/usr/bin/bash

# aws-lam-www-git-clone.bash

if [ -z $2 ] ; then
  echo "At least two arguments needed!"
  echo "Usage: $0 <repo> <keyName> [private]"
  exit 1;
fi

repo=$1
keyName=$2

if [ -z $3 ] ; then      # default is the public origin (my public github repos)
  origin1='https://github.com/LAMurakami/'
  origin2='git@github.com:LAMurakami/'
else                          # If private repos will be used origin must be set
  if test -f '/mnt/efs/aws-lam-full'; then
    origin1='git@ip6-localhost:'
  else
    origin1='git@aws:'                 # use ssh to aws connection setup earlier
  fi
  origin2='git@aws:'
fi

git clone $origin1${repo}.git /var/www/$repo
cd /var/www/$repo
git remote set-url origin $origin2$repo
if [ -z $3 ] ; then     # If public repos Set gitlab and aws additional remotes
  git remote add gitlab git@gitlab.com:aws-lam/$repo
  git remote add aws git@aws:$repo
  git remote rename origin github
fi
git checkout -b $keyName
git tag -a -m "AWS LAM Initialization for $keyName" b0-$keyName
