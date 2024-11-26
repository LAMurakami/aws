# aws-lam-apache2-sites-configuration-Debian-Ubuntu.bash
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
# --:----|----:----|----:----|----:----|----:----|----:----|----:----|----:----|
# This interim version includes comments about the current lam3 configuration
# where I initially tested the name-based virtual host resolution for ssl.
# I am in the process of renaming the ssl sites to include part of the
# certificate name used for this vertual host.

echo
echo 'AWS LAM enable aws site'
ln -s /var/www/aws/aws_apache2.conf /etc/apache2/sites-available/000-aws.conf
a2ensite 000-aws

echo
echo 'AWS LAM enable name-based virtual hosting for ssl'
cat /var/www/aws/ssl-NameVirtualHost.conf >> /etc/apache2/mods-available/ssl.conf

echo
echo 'AWS LAM enable aws site for ssl'
ln -s /var/www/aws/aws_ssl_duckdns_apache2.conf \
/etc/apache2/sites-available/001_aws_ssl_duckdns.conf
a2ensite 001_aws_ssl_duckdns

echo
echo 'AWS LAM enable additional sites'

ln -s /var/www/sites/sites_apache2.conf /etc/apache2/sites-available/030_sites.conf
a2ensite 030_sites

ln -s /var/www/sites/sites_ssl_lam1-apache2.conf \
/etc/apache2/sites-available/031_sites_ssl_lam1.conf
a2ensite 031_sites_ssl_lam1

ln -s /var/www/sites/sites_ssl_lamurakami-apache2.conf \
/etc/apache2/sites-available/032_sites_ssl_lamurakami.conf
a2ensite 032_sites_ssl_lamurakami

ln -s /var/www/cabo/sites-apache2.conf /etc/apache2/sites-available/040_cabo.conf
a2ensite 040_cabo

ln -s /var/www/cabo/cabo_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/041_cabo_ssl_lam1.conf
a2ensite 041_cabo_ssl_lam1

ln -s /var/www/cabo/cabo_ssl_lamurakami_apache2.conf \
/etc/apache2/sites-available/042_cabo_ssl_lamurakami.conf
a2ensite 042_cabo_ssl_lamurakami

ln -s /var/www/z/z_apache2.conf /etc/apache2/sites-available/050_z.conf
a2ensite 050_z

ln -s /var/www/z/z_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/051_z_ssl_lam1.conf
a2ensite 051_z_ssl_lam1

ln -s /var/www/z/z_ssl_lamurakami_apache2.conf \
/etc/apache2/sites-available/052_z_ssl_lamurakami.conf
a2ensite 052_z_ssl_lamurakami

ln -s /var/www/arsc/arsc_apache2.conf /etc/apache2/sites-available/060_arsc.conf
a2ensite 060_arsc

ln -s /var/www/arsc/arsc_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/061_arsc_ssl_lam1.conf
a2ensite 061_arsc_ssl_lam1

ln -s /var/www/arsc/arsc_ssl_lamurakami_apache2.conf \
/etc/apache2/sites-available/062_arsc_ssl_lamurakami.conf
a2ensite 062_arsc_ssl_lamurakami

# In file: /etc/apache2/sites-enabled/070_larryforalaska.conf

# In file: /etc/apache2/sites-enabled/081_mike.conf

# In file: /etc/apache2/sites-enabled/110_blinkenshell.conf

ln -s /var/www/olnes/olnes_apache2.conf /etc/apache2/sites-available/120_olnes.conf
a2ensite 120_olnes

ln -s /var/www/olnes/olnes_ssl_lam1_apache2.conf \
/etc/apache2/sites-available/121_olnes_ssl_lam1.conf
a2ensite 121_olnes_ssl_lam1

ln -s /var/www/olnes/olnes_ssl_lamurakami_apache2.conf \
/etc/apache2/sites-available/122_olnes_ssl_lamurakami.conf
a2ensite 122_olnes_ssl_lamurakami

# In file: /etc/apache2/sites-enabled/130_alaskademocrat.conf
# In file: /etc/apache2/sites-enabled/140_alaskademocrat.conf
# In file: /etc/apache2/sites-enabled/150_oldinteriordems_apache2.conf

# In file: /etc/apache2/sites-enabled/980_no-ssl.conf
# In file: /etc/apache2/sites-enabled/990_lam-ssl.conf
