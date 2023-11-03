#!/usr/bin/bash
#/mnt/efs/aws-lam1-ubuntu/lam1-Ubuntu-ARM-git-commit.bash
#/var/www/aws/lam1-Ubuntu-ARM-git-commit.bash
# This segment was stipped out of /var/www/aws/aws-nwo-lam1-Ubuntu-CloudInit-ARM.txt
#  because user data is limited to 16384 bytes.
# Removal of this segment and replacement with a call
#  got me from 17719 to 15535 bytes.
# This should be rewritten to accept the KEYNAME used in the commit as an argument
# It could also accept a list of sites and limit itself to within /var/www or accept
# that prefix as an argument.
# Thursday, November 2, 2023 @ 10:23:23 PM (Alaska Time) - imlementing IPv6

echo 'AWS LAM commit cloud-init changes in /var/www/aws git repo'
sh -c "cd /var/www/aws;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/no-ssl git repo'
sh -c "cd /var/www/no-ssl;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/arsc git repo'
sh -c "cd /var/www/arsc;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/sites git repo'
sh -c "cd /var/www/sites;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/cabo git repo'
sh -c "cd /var/www/cabo;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/z git repo'
sh -c "cd /var/www/z;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/blinkenshell/public_html git repo'
sh -c "cd /var/www/blinkenshell/public_html;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/olnes git repo'
sh -c "cd /var/www/olnes;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/alaskademocrat git repo'
sh -c "cd /var/www/alaskademocrat;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/larryforalaska git repo'
sh -c "cd /var/www/larryforalaska;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/lam git repo'
sh -c "cd /var/www/lam;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/mike git repo'
sh -c "cd /var/www/mike;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/interiordems git repo'
sh -c "cd /var/www/interiordems;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"
echo 'AWS LAM commit cloud-init changes in /var/www/oldinteriordems git repo'
sh -c "cd /var/www/oldinteriordems;git commit -a -m 'AWS LAM cloud-init lam1-Ubuntu-ARM'"