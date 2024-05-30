#!/usr/bin/bash

# aws-efs-tar-extract.bash

if [ -z $2 ] ; then
  echo "Two arguments needed!"
  echo "Usage: $0 <tarFile> <dir>"
  exit 1;
fi

tarFile=$1 # lam.tgz
dir=$2 # /var/www

if [[ ${REGION} == 'us-west-2' ]]; then"
  tar -xzf /mnt/efs/${tarFile} --directory ${dir}
else
  ssh aws "cat /mnt/efs/${tarFile}" | tar xzf - --directory ${dir}
fi
