#!/usr/bin/bash

#/var/www/aws/AWS-LAM-git-commit.bash
# This segment was stipped out of /var/www/aws/aws-nwo-lam1-Ubuntu-CloudInit-ARM.txt
#  because user data is limited to 16,384 bytes.
# Removal of this segment and replacement with a call
#  got me from 17,719 to 15,531 bytes.

# Program requires the KEYNAME used in the commit as an argument

if [ -z $1 ] ; then # Check that a parameter was provided
  echo "KEYNAME needed!" && exit 1;
fi

# It could also accept a list of sites and limit itself to within /var/www or accept
# that prefix as an argument.  The rest of this could loop to process that list.
# Thursday, November 2, 2023 @ 10:23:23 PM (Alaska Time) - imlementing IPv6

echo 'AWS LAM commit cloud-init changes in /var/www/aws git repo'
 cd /var/www/aws
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/no-ssl git repo'
 cd /var/www/no-ssl
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/arsc git repo'
 cd /var/www/arsc
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/sites git repo'
 cd /var/www/sites
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/cabo git repo'
 cd /var/www/cabo
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/z git repo'
 cd /var/www/z
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/blinkenshell/public_html git repo'
 cd /var/www/blinkenshell/public_html
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/olnes git repo'
 cd /var/www/olnes
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/alaskademocrat git repo'
 cd /var/www/alaskademocrat
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/larryforalaska git repo'
 cd /var/www/larryforalaska
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/lam git repo'
 cd /var/www/lam
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/mike git repo'
 cd /var/www/mike
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/interiordems git repo'
 cd /var/www/interiordems
 git commit -a -m "AWS LAM cloud-init $1"

echo 'AWS LAM commit cloud-init changes in /var/www/oldinteriordems git repo'
 cd /var/www/oldinteriordems
 git commit -a -m "AWS LAM cloud-init $1"
