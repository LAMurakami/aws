#! /bin/bash
# /var/www/aws/systemd/lam-wikidb-refresh-clone-from-aws-efs.bash
# Refresh the daily lam and wikidb backups from aws-efs

export REGION=$(cloud-init query region)

/var/www/aws/aws-efs-db-extract.bash Bk-20-MySQL.lam.sql.gz lam

/var/www/aws/aws-efs-db-extract.bash Bk-20-MySQL.wikidb.sql.gz wikidb

