#!/usr/bin/bash

# aws-efs-db-extract.bash

if [ -z $2 ] ; then
  echo "Two arguments needed!"
  echo "Usage: $0 <sqlFile> <db>"
  exit 1;
fi

sqlFile=$1
db=$2

if test -f '/mnt/efs/aws-lam-full'; then
  cat /mnt/efs/${sqlFile} | gunzip -c | mysql --user=lam ${db}
else
  ssh aws "cat /mnt/efs/${sqlFile}" | gunzip -c | mysql --user=lam ${db}
fi
