#!/bin/bash

<<PROGRAM_TEXT

This script will rebuild an archive of /var/www/aws resources
 if any of the resources have been changed or added.

The archive is extracted on a new instance with:

tar -xvzf /mnt/efs/aws-lam1-ubuntu/aws.tgz --directory /var/www

The following will list files changed since the archive was last rebuilt:

if [ $(find /var/www/aws -newer /mnt/efs/aws-lam1-ubuntu/aws.tgz -print \
 | sed 's|^/var/www/aws/||' | grep -v '.git/' | grep -v '.git$' | wc -l) \
 -gt 0 ]
then
  find /var/www/aws -newer /mnt/efs/aws-lam1-ubuntu/aws.tgz \
  | grep -v '.git/' | grep -v '.git$' \
  | xargs ls -ld --time-style=long-iso  | sed 's|/var/www/aws/||' 
fi

PROGRAM_TEXT

if [ $(find /var/www/aws -newer /mnt/efs/aws-lam1-ubuntu/aws.tgz -print \
| sed 's|^/var/www/aws/||' | grep -v '.git/' \
| grep -v '.git$' | wc -l) -gt 0 ]; then

  echo Recreating the aws-lam1-ubuntu/aws.tgz archive

  rm -f /mnt/efs/aws-lam1-ubuntu/aws.t{gz,xt}

  tar -cvzf /mnt/efs/aws-lam1-ubuntu/aws.tgz \
  --exclude='aws/.git' \
  --exclude='aws/html/RCS' \
  --directory /var/www aws 2>&1 \
  | tee /mnt/efs/aws-lam1-ubuntu/aws.txt

fi
