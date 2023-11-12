#!/usr/bin/bash

#/var/www/aws/AWS-LAM-git-commit.bash

# Program requires the KEYNAME used in the commit as an argument

if [ -z $2 ] ; then
  echo "At least two arguments needed!"
  echo "Usage: $0 keyName dir1 dir2 dir3 ..."
  exit 1;
fi

keyName=$1 ; shift ;

for dir in "$@"
do
  echo
    if [ -d "/var/www/$dir" ]; then
      echo "AWS LAM commit cloud-init changes in /var/www/$dir git repo"
      cd /var/www/$dir
      git commit -a -m "AWS LAM cloud-init $keyName"
    else
      echo "No /var/www/$dir git repo"
    fi
done
