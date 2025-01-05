#!/usr/bin/bash
# /var/www/aws/aws-lam-apache2-sites-configuration-Debian-Ubuntu.bash
# aws-lam-apache2-sites-configuration-Debian-Ubuntu.bash - aws repo - master branch
# https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam-apache2-sites-configuration-Debian-Ubuntu.bash?ref_type=heads
#
# This script does apache2 sites configuration for Debian and Ubuntu systems
# Debian and Ubuntu has apache2 commands to enable or disable site configuration
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
# Link to sites-available then use a2ensite for sites-enabled links

no_443=$1 # Optional 'no_443' parameter disables activation of secure sites

echo
echo 'AWS LAM enable aws site'
ln -s /var/www/aws/aws_apache2.conf /etc/apache2/sites-available/000-aws.conf
a2ensite 000-aws

echo
echo 'AWS LAM enable additional sites'

ln -s /var/www/sites/sites_apache2.conf /etc/apache2/sites-available/030_sites.conf
a2ensite 030_sites

ln -s /var/www/cabo/cabo_apache2.conf /etc/apache2/sites-available/040_cabo.conf
a2ensite 040_cabo

ln -s /var/www/z/z_apache2.conf /etc/apache2/sites-available/050_z.conf
a2ensite 050_z

ln -s /var/www/arsc/arsc_apache2.conf /etc/apache2/sites-available/060_arsc.conf
a2ensite 060_arsc

ln -s /var/www/mike/mike_apache2.conf /etc/apache2/sites-available/080_mike.conf
a2ensite 080_mike

ln -s /var/www/blinkenshell/public_html/blinkenshell_apache2.conf \
/etc/apache2/sites-available/110_blinkenshell.conf
a2ensite 110_blinkenshell

ln -s /var/www/olnes/olnes_apache2.conf /etc/apache2/sites-available/120_olnes.conf
a2ensite 120_olnes

# In file: /etc/apache2/sites-enabled/130_alaskademocrat.conf
ln -s /var/www/alaskademocrat/alaskademocrat_apache2.conf /etc/apache2/sites-available/130_alaskademocrat.conf
a2ensite 130_alaskademocrat

# In file: /etc/apache2/sites-enabled/140_interiordems.conf
ln -s /var/www/interiordems/interiordems_apache2.conf /etc/apache2/sites-available/140_interiordems.conf
a2ensite 140_interiordems

# In file: /etc/apache2/sites-enabled/150_oldinteriordems_apache2.conf
ln -s /var/www/oldinteriordems/oldinteriordems_apache2.conf /etc/apache2/sites-available/150_oldinteriordems.conf
a2ensite 150_oldinteriordems

# *.larryforalaska.com must be after non wildcard configurations
ln -s /var/www/larryforalaska/larryforalaska_apache2.conf /etc/apache2/sites-available/810_larryforalaska.conf
a2ensite 810_larryforalaska

ln -s /var/www/no-ssl/no-ssl_apache2.conf /etc/apache2/sites-available/980-no-ssl.conf
a2ensite 980-no-ssl
a2dissite 000-default

if [[ ${no_443} != 'no_443' ]] ; then # activate secure sites if not 'no_443'

echo
echo 'AWS LAM enable aws site for ssl'
ln -s /var/www/aws/aws_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/001_aws_ssl_lam1.conf
a2ensite 001_aws_ssl_lam1.conf
ln -s /var/www/aws/aws_ssl_duckdns_apache2.conf \
/etc/apache2/sites-available/005_aws_ssl_duckdns.conf
a2ensite 005_aws_ssl_duckdns

echo
echo 'AWS LAM enable lam site for ssl'
ln -s /var/www/lam/lam_apache2.conf /etc/apache2/sites-available/011_lam-ssl.conf
a2ensite 011_lam-ssl
a2dissite default-ssl

ln -s /var/www/sites/sites_ssl_lam1-apache2.conf \
/etc/apache2/sites-available/031_sites_ssl_lam1.conf
a2ensite 031_sites_ssl_lam1

ln -s /var/www/cabo/cabo_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/041_cabo_ssl_lam1.conf
a2ensite 041_cabo_ssl_lam1

ln -s /var/www/z/z_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/051_z_ssl_lam1.conf
a2ensite 051_z_ssl_lam1

ln -s /var/www/arsc/arsc_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/061_arsc_ssl_lam1.conf
a2ensite 061_arsc_ssl_lam1

ln -s /var/www/mike/mike_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/081_mike_ssl_lam1.conf
a2ensite 081_mike_ssl_lam1

ln -s /var/www/blinkenshell/public_html/blinkenshell_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/111-blinkenshell_ssl_lam1.conf
a2ensite 111-blinkenshell_ssl_lam1

ln -s /var/www/olnes/olnes_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/121_olnes_ssl_lam1.conf
a2ensite 121_olnes_ssl_lam1

ln -s /var/www/larryforalaska/larryforalaska_ssl_lam1_apache2.conf /etc/apache2/sites-available/811_larryforalaska_ssl_lam1.conf
a2ensite 811_larryforalaska_ssl_lam1

fi
