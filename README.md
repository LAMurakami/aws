# Linux Apache MariaDB in the cloud
The localhost / accessed by IP Address website for the
[lamurakami.duckdns.org](http://lamurakami.duckdns.org/)
[lam1.duckdns.org](http://lam1.duckdns.org/)
[lam2.duckdns.org](http://lam2.duckdns.org/)
[larryforalaska.duckdns.org](http://larryforalaska.duckdns.org/)
Dynamic Domain Name Service subdomains possibly being served by the instance.

The LAMurakami/aws repo contains content in the html folder and an apache2 configuration for a named virtual host for localhost and a number of aliases.

It also includes the CloudInit files to launch a new LAM AWS instance.  A Linux Apache MariaDB (LAM) Amazon Web Services (AWS) instance includes the Perl, Python and PHP application programming languages making it a LAMP model web service software stack instance.  A LAM AWS instance also has additional prerequisites for MediaWiki and the secure site web applications in a separate private lam repo.

AWS EC2 metadata values
local-hostname, local-ipv4, public-hostname, and public-ipv4
for the instance are used
in the apache2 ServerAlias for the named virtual host for localhost.
The Dynamic Domain Name Service subdomains used with DNS CNAME records
to serve my domain names are also included in the apache2 ServerAlias.

These values are used along with the instance-type on the main page for the
virtual host in my version of the this http site is working main page.  The values for the main page and configuration fiel are applied during the CloudInit process by [cloud-init.pl](https://github.com/LAMurakami/aws/blob/master/cloud-init.pl) and [ec2-user-data.bash](https://github.com/LAMurakami/aws/blob/master/ec2-user-data.bash)

Content (DocumentRoot) is now at /var/www/&lt;site&gt;/html and
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
         |-- aws_apache2.conf
         |-- html/   DocumentRoot /var/www/aws/html/</pre>

* aws-nwo-lam1-Ubuntu-CloudInit.txt is the configuration for the initializaton
of the instance during the first and subsequent boots.  During the first boot
it updates all the installed packages and then installs additional packages
to support LAMP model web services including a MediaWiki installation.
It modifies the File System Table so that a LAM AWS Elastic File System (EFS)
instance shared with all the LAM AWS EC2 instances is mounted by nfs4.
The site subdirectories and additional software is installed from git
repositories and tgz archives on this persistant shared filesystem.

* aws-nwo-lam2-Amazon-Linux-2-CloudInit.txt is an alternate initialization
for an LAM AWS EC2 using Amazon Linux 2 rather than Ubuntu Server as the
Linux component of the LAMP model web server.  Adding epel, php7.4 and
mariadb10.5 repositories using amazon-linux-extras enables this instance
to support the MediaWiki installation and be an AWS LAM clone.

* cloud-init.pl applies the public-hostname, public-ipv4, local-hostname and
local-ipv4 values from the /var/log/cloud-init-output.log to the
/var/www/aws/html/index.html and /var/www/aws/aws_apache2.conf files so the
Dynamic Domain Name Service page is displayed when the AWS public domain name
or IP address is visited.

* &lt;site&gt;_apache2.conf is the site apache2 configuration file.  The LAM AWS
EC2 LAMP instance does not support .htaccess files.  The &lt;site&gt;_apache2.conf
file is linked into /etc/apache2/sites-available and then enabled with
a2ensite in the Implement_more_sites_conf.bash script which also assigns
a three digit numerical order for the sites.  Force apache2 to read any
changes in configuration files with:
<pre>systemctl reload apache2</pre>

See Also:
* [no-ssl repo README.md](https://github.com/LAMurakami/no-ssl#readme)
* [arsc repo README.md](https://github.com/LAMurakami/arsc#readme)
* [ubuntu-etc repo README.md](https://github.com/LAMurakami/ubuntu-etc#readme) Ubuntu Server 20.04 configuration changes for LAM AWS VPC EC2 instances
* [A Cloud-init script that anyone could launch on AWS](https://blog.lamurakami.com/2020/08/04/Cloud-init-script-that-anyone-could-launch-on-AWS.html)
