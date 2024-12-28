# qemu-lam-apache2-sites-configuration-Debian-Ubuntu.bash
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
#
# --:----|----:----|----:----|----:----|----:----|----:----|----:----|----:----|
# This version was created from the Debian-Ubuntu version and then modified
#
# gd aws-lam-apache2-sites-configuration-Debian-Ubuntu.bash \
# qemu-lam-apache2-sites-configuration-Debian-Ubuntu.bash
#

echo
echo 'QEMU LAM enable gci site'
ln -s /var/www/gci/gci_apache2.conf /etc/apache2/sites-available/000-gci.conf
a2ensite 000-gci

echo
echo 'QEMU LAM enable gci site for ssl'
ln -s /var/www/gci/gci_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/001_gci_ssl_lam1.conf
a2ensite 001_gci_ssl_lam1.conf

ln -s /var/www/gci/gci_ssl_duckdns_apache2.conf \
/etc/apache2/sites-available/005_gci_ssl_duckdns.conf
a2ensite 005_gci_ssl_duckdns

echo
echo 'QEMU LAM enable lam site for ssl'
ln -s /var/www/lam/lam_apache2.conf /etc/apache2/sites-available/011_lam-ssl.conf
a2ensite 011_lam-ssl
a2dissite default-ssl

echo
echo 'QEMU LAM enable additional sites'

ln -s /var/www/sites/sites_apache2.conf /etc/apache2/sites-available/030_sites.conf
a2ensite 030_sites

ln -s /var/www/sites/sites_ssl_lam1-apache2.conf \
/etc/apache2/sites-available/031_sites_ssl_lam1.conf
a2ensite 031_sites_ssl_lam1

ln -s /var/www/z/z_apache2.conf /etc/apache2/sites-available/050_z.conf
a2ensite 050_z

ln -s /var/www/z/z_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/051_z_ssl_lam1.conf
a2ensite 051_z_ssl_lam1

ln -s /var/www/no-ssl/no-ssl_apache2.conf /etc/apache2/sites-available/980-no-ssl.conf
a2ensite 980-no-ssl
a2dissite 000-default
