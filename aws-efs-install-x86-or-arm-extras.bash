#!/usr/bin/bash

# /var/www/aws/aws-efs-install-x86-or-arm-extras.bash

# --:----|----:----|----:----|----:----|----:----|----:----|----:----|----:----|

# This program is designed to reduce the number of cloud init files by half.
#
# At the current time I have separate scripts for each machine type for each
#  distribution I can handle and a separate script for each machine type.
# In 2024 I doubled the number of scripts again creating a new one for each
#  existing one to handle No-Public-IPv4
#
# This program will use the new aws-efs-tar-extract.bash program that directly
#  accesses the efs when in the us-west-2 Oregon region but relies on the
#  ssh to aws connectivity for any an instance launched in any other region.
#
# I have decided that the extras installed by this program are not critical
#  and an instance launched in another region without the main aws instance
#  is mostly functional if the installs fail.

if [ -z $1 ] ; then
  echo "Argument needed!"
  echo "Usage: $0 <distro>"
  exit 1;
fi

distro=$1

case $distro in 

  ubuntu)
    if [ $(uname -m) = "x86_64" ]; then
      echo "AWS LAM Installing $distro distro x86_64 extras"
      echo
      echo 'AWS LAM Installing GNU which v2.21 compiled for Ubuntu Server 22.04'
      /var/www/aws/aws-efs-tar-extract.bash aws-lam1-ubuntu/which-Ubuntu-22-04.tgz /usr/local
      file /usr/local/bin/which
      echo
      echo 'AWS LAM Installing GNU tnef 1.4.18 compiled for Ubuntu Server 22.04'
      /var/www/aws/aws-efs-tar-extract.bash aws-lam1-ubuntu/tnef-Ubuntu-22-04.tgz /usr/local
      file /usr/local/bin/tnef
      echo
      echo 'AWS LAM Installing leafpad compiled for Ubuntu Server 22.04'
      /var/www/aws/aws-efs-tar-extract.bash aws-lam1-ubuntu/leafpad-Ubuntu-22-04.tgz /usr/local
    else
      echo "AWS LAM Installing $distro distro aarch64 extras"
      echo
      echo 'AWS LAM Installing GNU which v2.21 compiled for ARM Ubuntu Server 22.04'
      /var/www/aws/aws-efs-tar-extract.bash aws-lam1-ubuntu/which-Ubuntu-22-04-ARM.tgz /usr/local
      file /usr/local/bin/which
      echo
      echo 'AWS LAM Installing GNU tnef 1.4.18 compiled for ARM Ubuntu Server 22.04'
      /var/www/aws/aws-efs-tar-extract.bash aws-lam1-ubuntu/tnef-Arm-Ubuntu-22-04.tgz /usr/local
      file /usr/local/bin/tnef
      echo
      echo 'AWS LAM Installing leafpad compiled for ARM Ubuntu Server 22.04'
      /var/www/aws/aws-efs-tar-extract.bash aws-lam1-ubuntu/leafpad-Arm-Ubuntu-22-04.tgz /usr/local
    fi
    ;;

  debian) 
    if [ $(uname -m) = "x86_64" ]; then
      echo "Installing $distro distro x86_64 extras"
      echo
      /var/www/aws/aws-efs-tar-extract.bash Debian-12/which-Debian-12-x86.tgz /usr/local
    else
      echo "Installing $distro distro aarch64 extras"
      echo
      /var/www/aws/aws-efs-tar-extract.bash Debian-12/which-Debian-12-ARM.tgz /usr/local
    fi
    ;;

  AL2023) 
    if [ $(uname -m) = "x86_64" ]; then
      echo "Installing $distro distro x86_64 extras"
    else
      echo "Installing $distro distro aarch64 extras"
    fi
    ;;

  *) 
    echo "$0 doesn't yet handle distro $distro extras"
    ;; 
esac
