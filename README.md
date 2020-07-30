# Linux Apache MariaDB in the cloud
accessed by IP Address website for the
[lamurakami.duckdns.org](http://lamurakami.duckdns.org/)
[lam1.duckdns.org](http://lam1.duckdns.org/)
[lam2.duckdns.org](http://lam2.duckdns.org/)
[larryforalaska.duckdns.org](http://larryforalaska.duckdns.org/)
Dynamic Domain Name Service subdomains possibly being served by the instance.

This repo contains content in the html folder and an apache2 configuration.

Content (DocumentRoot) is now at /var/www/&lt;site&gt;/html for all sites and
configuration and supporting files within /var/www/&lt;site&gt; but not the
DocumentRoot.

The LAM AWS EC2 lam1 CloudInit builds a
[LAMP](https://en.wikipedia.org/wiki/LAMP_(software_bundle))
model web service software
stack instance from the Latest Ubuntu Server image available.
The configuration and content is split into several sub directories of
/var/www/ with each being a separate git repository.  Each repo has the
content in a html/ subdirectory as outlined below:

<pre>/var/www/aws/
         |-- aws-nwo-lam1-Ubuntu-CloudInit.txt
         |-- cloud-init.pl
         |-- <site>_apache2.conf
         |-- <site>_archive_rebuild.bash
         |-- html/                     DocumentRoot /var/www/aws/html/
/var/www/no-ssl/
         |-- apache2.conf
         |-- Implement_no-ssl_conf.bash
         |-- Implement_more_sites_conf.bash
         |-- Implement_more_apache2_stuff.bash
         |-- <site>_apache2.conf
         |-- <site>_archive_rebuild.bash
         |-- html/                     DocumentRoot /var/www/no-ssl/html/
             |-- Public/
                 |-- Scripts/
/var/www/&lt;additional-sites&gt;/
         |-- <site>_apache2.conf
         |-- <site>_archive_rebuild.bash
         |-- html/                     DocumentRoot /var/www/<additional-sites>/html/
/var/www/lam/
         |-- Implement_lam_conf.bash
         |-- <site>_apache2.conf
         |-- <site>_archive_rebuild.bash
         |-- .ht{group,passwd}
         |-- data/
         |-- html/                     DocumentRoot /var/www/lam/html/
             |-- Private/
                 |-- Scripts/</pre>

* Implement* These four scripts will implement the configuration when run
with root (sudo) permissions.

* aws-nwo-lam1-Ubuntu-CloudInit.txt is the configuration for the initializaton
of the instance during the first and subsequent boots.  During the first boot
it updates all the installed packages and then installs additional packages
to support LAMP model web services including a MediaWiki installation.
It modifies the File System Table so that a LAM AWS Elastic File System (EFS)
instance shared with all the LAM AWS EC2 instances is mounted by nfs4.
The site subdirectories and additional software is installed from tgz
archives on this persistant shared filesystem.

* apache2.conf is the main apache2 configuration file.  The /Public alias is
included here allowing no-ssl/html/Public/ content to be accessed from any
site and a set of /var/www/no-ssl/html/Public/Scripts Directory directives
defining .cgi-pl as scripts to be accessed from any site.
A set of custom error handlers are also defined here.

* cloud-init.pl applies the public-hostname, public-ipv4, local-hostname and
local-ipv4 values from the /var/log/cloud-init-output.log to the
/var/www/aws/html/index.html and /var/www/aws/aws_apache2.conf files so the
Dynamic Domain Name Service page is displayed when the AWS public domain name
or IP address is visited.

* <site>_apache2.conf is the site apache2 configuration file.  The LAM AWS
EC2 LAMP instance does not support .htaccess files.  The <site>_apache2.conf
file is linked into /etc/apache2/sites-available and then enabled with
a2ensite in the Implement_more_sites_conf.bash script which also assigns
a three digit numerical order for the sites.  Force apache2 to read any
changes in configuration files with:
 systemctl reload apache2

* <site>_archive_rebuild.bash is a script to rebuild a tar archive if anything
has changed since the archive was last rebuilt.  By not rebuilding the archive
if nothing has changed the data transmitted to a remote copy of the backups is
reduced.  The whole archive will be transmitted if any file changes but the
archive is compressed.  The archive rebuild should only be run on the master
system and not on clones.  The script is linked into the backup directory with:
 ln -s /var/www/${REPO}/${REPO}_archive_rebuild.bash \
 /mnt/efs/aws-lam1-ubuntu/${REPO}
The script will only run if the archive file already exists as it is used as
the Newer reference.  Create a zero byte archive file with an old date with:
 touch -d 1955-05-20 /mnt/efs/aws-lam1-ubuntu/${REPO}.tgz

* site_perl-LAM contains perl modules to be linked into site_perl.
The modules simplify a number of cgi perl routines used in both Public
and Private scripts of the sites.
