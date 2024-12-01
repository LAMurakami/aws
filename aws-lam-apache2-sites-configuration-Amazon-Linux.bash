# aws-lam-apache2-sites-configuration-Amazon-Linux.bash
#
# This script does apache2 sites configuration for Amazon Linux systems
# Debian and Ubuntu has apache2 commands to enable or disable site configuration
# Amazon Linux and Fedora systems do not implement the a2{en,dis}{site,mod}
# commands so I use zzz_ddd names directly in /etc/httpd/conf.d for the
# ssl VirtualHost cinfiguration files.
#
# I use a separate configuration file for each site interface:port name
# The port 443 ssl configuration files include specification of the certificate
# file location used in the secure connection.
#
# I now support secure comunications for 5 duckdns.org subdomain names and
# *.lam1.us *.lamurakami.com *.larrymurakami.com and *.larryforalaska.com
# domain names.
#
# The site names presented for apache2 start with a zzz and three digit number to
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
# This version was created from the Debian-Ubuntu version and then modified
#
# gd aws-lam-apache2-sites-configuration-Debian-Ubuntu.bash \
# aws-lam-apache2-sites-configuration-Amazon-Linux.bash
#

echo
echo 'AWS LAM enable aws site'
ln -s /var/www/aws/aws_apache2.conf /etc/httpd/conf.d/zzz_000_aws.conf

echo
echo 'AWS LAM enable aws site for ssl'
ln -s /var/www/aws/aws_ssl_duckdns_apache2.conf \
/etc/httpd/conf.d/zzz_001_aws_ssl_duckdns.conf

echo
echo 'AWS LAM enable additional sites'

ln -s /var/www/sites/sites_apache2.conf /etc/httpd/conf.d/zzz_030_sites.conf

ln -s /var/www/sites/sites_ssl_lam1-apache2.conf \
/etc/httpd/conf.d/zzz_031_sites_ssl_lam1.conf

ln -s /var/www/sites/sites_ssl_lamurakami-apache2.conf \
/etc/httpd/conf.d/zzz_032_sites_ssl_lamurakami.conf

ln -s /var/www/sites/sites_ssl_larrymurakami-apache2.conf \
/etc/httpd/conf.d/zzz_033_sites_ssl_larrymurakami.conf

ln -s /var/www/sites/sites_ssl_larryforalaska-apache2.conf \
/etc/httpd/conf.d/zzz_034_sites_ssl_larryforalaska.conf

ln -s /var/www/cabo/cabo_apache2.conf /etc/httpd/conf.d/zzz_040_cabo.conf

ln -s /var/www/cabo/cabo_ssl_lam1_apache2.conf \
/etc/httpd/conf.d/zzz_041_cabo_ssl_lam1.conf

ln -s /var/www/cabo/cabo_ssl_lamurakami_apache2.conf \
/etc/httpd/conf.d/zzz_042_cabo_ssl_lamurakami.conf

rm /etc/httpd/conf.d/welcome.conf
ln -s /var/www/z/z_apache2.conf /etc/httpd/conf.d/zzz_050_z.conf

ln -s /var/www/z/z_ssl_lam1_apache2.conf \
/etc/httpd/conf.d/zzz_051_z_ssl_lam1.conf

ln -s /var/www/z/z_ssl_lamurakami_apache2.conf \
/etc/httpd/conf.d/zzz_052_z_ssl_lamurakami.conf

ln -s /var/www/z/z_ssl_larrymurakami_apache2.conf \
/etc/httpd/conf.d/zzz_053_z_ssl_larrymurakami.conf

ln -s /var/www/z/z_ssl_larryforalaska_apache2.conf \
/etc/httpd/conf.d/zzz_054_z_ssl_larryforalaska.conf

ln -s /var/www/arsc/arsc_apache2.conf /etc/httpd/conf.d/zzz_060_arsc.conf

ln -s /var/www/arsc/arsc_ssl_lam1_apache2.conf \
/etc/httpd/conf.d/zzz_061_arsc_ssl_lam1.conf

ln -s /var/www/arsc/arsc_ssl_lamurakami_apache2.conf \
/etc/httpd/conf.d/zzz_062_arsc_ssl_lamurakami.conf

ln -s /var/www/larryforalaska/larryforalaska_apache2.conf \
/etc/httpd/conf.d/zzz_070_larryforalaska.conf

ln -s /var/www/larryforalaska/larryforalaska_ssl_lam1_apache2.conf \
/etc/httpd/conf.d/zzz_071_larryforalaska_ssl_lam1.conf

ln -s /var/www/larryforalaska/larryforalaska_ssl_lamurakami_apache2.conf \
/etc/httpd/conf.d/zzz_072_larryforalaska_ssl_lamurakami.conf

ln -s /var/www/mike/mike_apache2.conf /etc/httpd/conf.d/zzz_080_mike.conf

ln -s /var/www/mike/mike_ssl_lam1_apache2.conf \
/etc/httpd/conf.d/zzz_081_mike_ssl_lam1.conf

ln -s /var/www/mike/mike_ssl_lamurakami_apache2.conf \
/etc/httpd/conf.d/zzz_082_mike_ssl_lamurakami.conf

ln -s /var/www/mike/mike_ssl_larrymurakami_apache2.conf \
/etc/httpd/conf.d/zzz_083_mike_ssl_larrymurakami.conf

ln -s /var/www/blinkenshell/public_html/blinkenshell_apache2.conf \
/etc/httpd/conf.d/zzz_110_blinkenshell.conf

ln -s /var/www/blinkenshell/public_html/blinkenshell_ssl_lam1_apache2.conf \
/etc/httpd/conf.d/zzz_111-blinkenshell_ssl_lam1.conf

ln -s /var/www/blinkenshell/public_html/blinkenshell_ssl_lamurakami_apache2.conf \
/etc/httpd/conf.d/zzz_112-blinkenshell_ssl_lamurakami.conf

ln -s /var/www/blinkenshell/public_html/blinkenshell_ssl_larrymurakami_apache2.conf \
/etc/httpd/conf.d/zzz_113-blinkenshell_ssl_larrymurakami.conf

ln -s /var/www/blinkenshell/public_html/blinkenshell_ssl_larryforalaska_apache2.conf \
/etc/httpd/conf.d/zzz_114-blinkenshell_ssl_larryforalaska.conf

ln -s /var/www/olnes/olnes_apache2.conf /etc/httpd/conf.d/zzz_120_olnes.conf

ln -s /var/www/olnes/olnes_ssl_lam1_apache2.conf \
/etc/httpd/conf.d/zzz_121_olnes_ssl_lam1.conf

ln -s /var/www/olnes/olnes_ssl_lamurakami_apache2.conf \
/etc/httpd/conf.d/zzz_122_olnes_ssl_lamurakami.conf

# In file: /etc/apache2/sites-enabled/130_alaskademocrat.conf
ln -s /var/www/alaskademocrat/alaskademocrat_apache2.conf /etc/httpd/conf.d/zzz_130_alaskademocrat.conf

# In file: /etc/apache2/sites-enabled/140_interiordems.conf
ln -s /var/www/interiordems/interiordems_apache2.conf /etc/httpd/conf.d/zzz_140_interiordems.conf

# In file: /etc/apache2/sites-enabled/150_oldinteriordems_apache2.conf
ln -s /var/www/oldinteriordems/oldinteriordems_apache2.conf /etc/httpd/conf.d/zzz_150_oldinteriordems.conf

# *.larrymurakami.com must be after non wildcard configurations
ln -s /var/www/larryforalaska/larryforalaska_ssl_larrymurakami_apache2.conf \
/etc/httpd/conf.d/zzz_973_larryforalaska_ssl_larrymurakami.conf

# *.larryforalaska.com must be after non wildcard configurations
ln -s /var/www/larryforalaska/larryforalaska_ssl_larryforalaska_apache2.conf \
/etc/httpd/conf.d/zzz_974_larryforalaska_ssl_larryforalaska.conf

# /etc/httpd/conf.d/zzz_980_no-ssl.conf
# /etc/httpd/conf.d/zzz_990_lam-ssl.conf
