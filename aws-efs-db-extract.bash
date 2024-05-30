#!/usr/bin/bash

# aws-efs-db-extract.bash

if [ -z $2 ] ; then
  echo "Two arguments needed!"
  echo "Usage: $0 <sqlFile> <db>"
  exit 1;
fi

sqlFile=$1
db=$2

if [[ ${REGION} == 'us-west-2' ]]; then"
  cat /mnt/efs/${tarFile} | gunzip -c | mysql --user=lam ${db}
else
  ssh aws "cat /mnt/efs/${tarFile}" | gunzip -c | mysql --user=lam ${db}
fi
