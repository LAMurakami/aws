#!/usr/bin/bash
# qemu-lam-apache2-sites-configuration-OpenSUSE.bash
#
# This script does apache2 sites configuration for OpenSUSE systems
# Debian and Ubuntu has apache2 commands to enable or disable site configuration
# OpenSUSE, Amazon Linux and Fedora systems do not implement the a2{en,dis}{site,mod}
# commands so I use ddd names directly in /etc/apache2/vhosts.d for the
# VirtualHost cinfiguration files.
#
# I use a separate configuration file for each site interface:port name
# The port 443 ssl configuration files include specification of the certificate
# file location used in the secure connection.
#
# I now support secure comunications for 5 duckdns.org subdomain names and
# *.lam1.us *.lamurakami.com *.larrymurakami.com and *.larryforalaska.com
# domain names.
#
# The site names presented for apache2 start with a three digit number to
# control the order of name-based virtual host resolution.  The first virtual
# host for each interface:port becomes the default and subsequent virtual host
# configuration files must match a name or alias in the definition to override
# the default.  I use the wildcard for the interface so there are two paths for
# the name resolution for either no-ssl or ssl requests.
#
# For both no-ssl or ssl requests I am using the aws site which displays the
# Public / Private IPv4 and Public IPv6 addresses as well as the Dynamic Domain
# Name Service names and instance type for an aws instance as the default.
#
# This script is one of many called by the initialization created to get around
# the 16K size limit for a user data file specified when launching an aws
# instance.
#
# --:----|----:----|----:----|----:----|----:----|----:----|----:----|----:----|
# This version was created from the Fedora version and then modified
#
# gd qemu-lam-apache2-sites-configuration-Fedora.bash \
# qemu-lam-apache2-sites-configuration-OpenSUSE.bash
#

echo
echo 'QEMU LAM enable gci site'
ln -s /var/www/gci/gci_apache2.conf /etc/apache2/vhosts.d/000_gci.conf

echo
echo 'QEMU LAM enable gci site for ssl'
ln -s /var/www/gci/gci_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/001_gci_ssl_lam1.conf

ln -s /var/www/gci/gci_ssl_duckdns_apache2.conf \
/etc/apache2/vhosts.d/005_gci_ssl_duckdns.conf

echo
echo 'QEMU LAM enable lam site for ssl'
ln -s /var/www/lam/lam_apache2.conf /etc/apache2/vhosts.d/011_lam-ssl.conf

echo
echo 'QEMU LAM enable additional sites'

ln -s /var/www/sites/sites_apache2.conf /etc/apache2/vhosts.d/030_sites.conf

ln -s /var/www/sites/sites_ssl_lam1-apache2.conf \
/etc/apache2/vhosts.d/031_sites_ssl_lam1.conf

ln -s /var/www/z/z_apache2.conf /etc/apache2/vhosts.d/050_z.conf

ln -s /var/www/z/z_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/051_z_ssl_lam1.conf

ln -s /var/www/no-ssl/no-ssl_apache2.conf /etc/apache2/vhosts.d/980-no-ssl.conf
