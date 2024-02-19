#!/usr/bin/bash

#aws-lam-efs-www-git-clone.bash

if [ -z $2 ] ; then
  echo "Two arguments needed!"
  echo "Usage: $0 <repo> <keyName>"
  exit 1;
fi

repo=$1
keyName=$2

# The git repos are in the us-west-2 Oregon region
if [[ ${REGION} == 'us-west-2' ]]; then
  origin1='/mnt/efs/git/'
else
# If not in the us-west-2 Oregon region use the ssh to aws connection
  origin1='aws:/mnt/efs/git/'
fi

git clone $origin1$repo /var/www/$repo
cd /var/www/$repo
git checkout -b $keyName
