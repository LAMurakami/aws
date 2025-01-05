#!/usr/bin/bash
# aws-lam-apache2-sites-configuration-OpenSUSE.bash
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
#

echo
echo 'AWS LAM enable aws site'
ln -s /var/www/aws/aws_apache2.conf /etc/apache2/vhosts.d/000_aws.conf

echo
echo 'AWS LAM enable aws site for ssl'
ln -s /var/www/aws/aws_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/001_aws_ssl_lam1.conf
ln -s /var/www/aws/aws_ssl_duckdns_apache2.conf \
/etc/apache2/vhosts.d/005_aws_ssl_duckdns.conf

echo
echo 'AWS LAM enable lam site for ssl'
ln -s /var/www/lam/lam_apache2.conf /etc/apache2/vhosts.d/011_lam-ssl.conf

echo
echo 'AWS LAM enable additional sites'

ln -s /var/www/sites/sites_apache2.conf /etc/apache2/vhosts.d/030_sites.conf

ln -s /var/www/sites/sites_ssl_lam1-apache2.conf \
/etc/apache2/vhosts.d/031_sites_ssl_lam1.conf

ln -s /var/www/cabo/cabo_apache2.conf /etc/apache2/vhosts.d/040_cabo.conf

ln -s /var/www/cabo/cabo_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/041_cabo_ssl_lam1.conf

ln -s /var/www/z/z_apache2.conf /etc/apache2/vhosts.d/050_z.conf

ln -s /var/www/z/z_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/051_z_ssl_lam1.conf

ln -s /var/www/arsc/arsc_apache2.conf /etc/apache2/vhosts.d/060_arsc.conf

ln -s /var/www/arsc/arsc_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/061_arsc_ssl_lam1.conf

ln -s /var/www/mike/mike_apache2.conf /etc/apache2/vhosts.d/080_mike.conf

ln -s /var/www/mike/mike_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/081_mike_ssl_lam1.conf

ln -s /var/www/blinkenshell/public_html/blinkenshell_apache2.conf \
/etc/apache2/vhosts.d/110_blinkenshell.conf

ln -s /var/www/blinkenshell/public_html/blinkenshell_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/111-blinkenshell_ssl_lam1.conf

ln -s /var/www/olnes/olnes_apache2.conf /etc/apache2/vhosts.d/120_olnes.conf

ln -s /var/www/olnes/olnes_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/121_olnes_ssl_lam1.conf

# In file: /etc/apache2/sites-enabled/130_alaskademocrat.conf
ln -s /var/www/alaskademocrat/alaskademocrat_apache2.conf \
/etc/apache2/vhosts.d/130_alaskademocrat.conf

# In file: /etc/apache2/sites-enabled/140_interiordems.conf
ln -s /var/www/interiordems/interiordems_apache2.conf \
/etc/apache2/vhosts.d/140_interiordems.conf

# In file: /etc/apache2/sites-enabled/150_oldinteriordems_apache2.conf
ln -s /var/www/oldinteriordems/oldinteriordems_apache2.conf \
/etc/apache2/vhosts.d/150_oldinteriordems.conf

# *.larryforalaska.com must be after non wildcard configurations
ln -s /var/www/larryforalaska/larryforalaska_apache2.conf \
/etc/apache2/vhosts.d/810_larryforalaska.conf

ln -s /var/www/larryforalaska/larryforalaska_ssl_lam1_apache2.conf \
/etc/apache2/vhosts.d/811_larryforalaska_ssl_lam1.conf

ln -s /var/www/no-ssl/no-ssl_apache2.conf /etc/apache2/vhosts.d/980-no-ssl.conf
