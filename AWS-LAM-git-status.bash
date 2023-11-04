#!/usr/bin/bash
# AWS-LAM-git-status.bash

if [ -z $1 ] ; then
  echo "At least one argument needed!"
  echo "$0 dirs"
  exit 1;
fi

for dir in "$@"
do
  echo
    if [ -d "/var/www/$dir" ]; then
      echo "git status in /var/www/$dir git repo"
      cd /var/www/$dir
      git status
    else
      echo "No /var/www/$dir git repo"
    fi
done
