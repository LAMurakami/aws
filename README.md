# Linux Apache MariaDB in the cloud
## GitLab and GitHub public Projects/Repositories
The
[gitlab.com/aws-lam/aws](https://gitlab.com/aws-lam/aws)
Project is a clone of the
[github.com/LAMurakami/aws](https://github.com/LAMurakami/aws)
Repostory.  My
[gitlab.com/LAMurakami](https://gitlab.com/LAMurakami)
account was created so that Projects can be cloned using https without
authentication over IPv6 as well as IPv4 unlike the
[github.com/LAMurakami](https://github.com/LAMurakami)
Repostories that can only be accessed over IPv6 with the
[IPv6 only workaround.](https://lamurakami.github.io/blog/2024/06/05/Access-GitHub-com-from-an-instance-without-a-public-IPv4-address.html)

## by IP Address website
The localhost / accessed by IP Address website for the
[lamurakami.freeddns.org](https://lamurakami.freeddns.org/)
[lam1.freeddns.org](https://lam1.freeddns.org/)
[lam2.freeddns.org](https://lam2.freeddns.org/)
[lamurakami.duckdns.org](http://lamurakami.duckdns.org/)
[lam1.duckdns.org](http://lam1.duckdns.org/)
[lam2.duckdns.org](http://lam2.duckdns.org/)
[larryforalaska.duckdns.org](http://larryforalaska.duckdns.org/)
Dynamic Domain Name Service subdomains possibly being served by the instance.

The aws repo contains content in the html folder and an apache2 configuration for a named virtual host for localhost and a number of aliases.

It also includes the CloudInit files to launch a new LAM AWS instance.  A Linux Apache MariaDB (LAM) Amazon Web Services (AWS) instance includes the Perl, Python and PHP application programming languages making it a LAMP model web service software stack instance.  A LAM AWS instance also has additional prerequisites for MediaWiki and the secure site web applications in a separate private lam repo.

AWS EC2 metadata values
local-hostname, local-ipv4, public-hostname, and public-ipv4
for the instance are used
in the apache2 ServerAlias for the named virtual host for localhost.
The Dynamic Domain Name Service subdomains used with DNS CNAME records
to serve my domain names are also included in the apache2 ServerAlias.

These values are used along with the instance-type on the main page for the
virtual host in my version of the this http site is working main page.  The values for the main page and configuration file are applied during the CloudInit process by [cloud-init.pl](https://gitlab.com/aws-lam/aws/-/blob/master/cloud-init.pl?ref_type=heads) and [ec2-user-data.pl](https://gitlab.com/aws-lam/aws/-/blob/master/ec2-user-data.pl?ref_type=heads)

A public-ipv6 value is also used to update the VirtualHost configuration for all the additional-sites possibly being served by the instance.
Additional sites served by the instance possibly include:
lam
[no-ssl](https://gitlab.com/aws-lam/no-ssl/-/tree/master?ref_type=heads)
[arsc](https://gitlab.com/aws-lam/arsc/-/tree/master?ref_type=heads)
[sites](https://gitlab.com/aws-lam/sites/-/tree/master?ref_type=heads)
[cabo](https://gitlab.com/aws-lam/cabo/-/tree/master?ref_type=heads)
[z](https://gitlab.com/aws-lam/z/-/tree/master?ref_type=heads)
[blinkenshell](https://gitlab.com/aws-lam/blinkenshell/-/tree/master?ref_type=heads)
[olnes](https://gitlab.com/aws-lam/olnes/-/tree/master?ref_type=heads)
alaskademocrat
[larryforalaska](https://gitlab.com/aws-lam/larryforalaska/-/tree/master?ref_type=heads)
mike
interiordems
oldinteriordems

Content (DocumentRoot) is now at /var/www/&lt;site&gt;/html and
configuration and supporting files within /var/www/&lt;site&gt; but not the
DocumentRoot.

The LAM AWS EC2 lam1 CloudInit builds a
[LAMP](https://en.wikipedia.org/wiki/LAMP_(software_bundle))
model web service software
stack instance from the Latest Ubuntu Server image available.
This repo has the
content in a html/ subdirectory as outlined below:

<pre>/var/www/aws/
         |-- aws-nwo-lam1-Ubuntu-CloudInit.txt
         |-- cloud-init.pl
         |-- aws_apache2.conf
         |-- html/   DocumentRoot /var/www/aws/html/</pre>

* [aws-lam1-Ubuntu-24-Noble-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam1-Ubuntu-24-Noble-CloudInit.txt?ref_type=heads)
and
[aws-nwo-lam1-Ubuntu-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-nwo-lam1-Ubuntu-CloudInit.txt?ref_type=heads)
are the cloud-config configuration files for the initializaton
of an Ubuntu 24.04 Noble Numbat instance.  During the first boot all the
installed packages are updated and then additional packages are installed
to support LAMP model web services including a MediaWiki installation.
The File System Table is modified so that a LAM AWS Elastic File System (EFS)
instance shared with all the LAM AWS EC2 instances in the region
is mounted by nfs4.
Site subdirectories and additional software are sometimes installed from git
repositories and tgz archives on this persistant shared filesystem
in the us-west-2 Oregon region where my main instance runs.
A No-Public-IPv4 instance may require the main instance in the us-west-2 Oregon
region be up and running as a dual stack IPv4 and IPv6 ssh server to support
some initialization steps.

* [aws-lam1-Ubuntu-22-Jammy-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam1-Ubuntu-22-Jammy-CloudInit.txt?ref_type=heads)
and
[aws-nwo-lam1-Ubuntu-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-nwo-lam1-Ubuntu-CloudInit.txt?ref_type=heads)
are the cloud-config configuration files for the initializaton
of an Ubuntu 22.04 Jammy Jellyfish instance.

* [aws-lam2-Debian-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam2-Debian-CloudInit.txt?ref_type=heads)
and
[aws-nwo-lam2-Debian-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam2-Debian-CloudInit.txt?ref_type=heads)
are the cloud-config configuration files for the initializaton
of a Debian 12 instance.

* [aws-lam2-Amazon-Linux-2023-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam2-Amazon-Linux-2023-CloudInit.txt?ref_type=heads)
and
[aws-nwo-lam2-Amazon-Linux-2023-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-nwo-lam2-Amazon-Linux-2023-CloudInit.txt?ref_type=heads)
are alternate initializations for an LAM AWS EC2 using Amazon Linux 2023.
These cloud-config files can be used on a t3.nano instance with only 0.5 GiB of
memory since the
[dnf Out of Memory bug](https://bugzilla.redhat.com/show_bug.cgi?id=1907030)
on swapless machines with 1G or less
of RAM was fixed

* [aws-lam2-SLES-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam2-SLES-CloudInit.txt?ref_type=heads) is the cloud-config configuration file for the initializaton of a SLES 15 sp6 instance.

* [aws-lam2-ssh443-Amazon-Linux-2-CloudInit.txt](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam2-ssh443-Amazon-Linux-2-CloudInit.txt?ref_type=heads)
is an alternate initialization
for an LAM AWS EC2 using Amazon Linux 2 rather than Ubuntu Server as the
Linux component of the LAMP model web server.  Adding epel, php7.4 and
mariadb10.5 repositories using amazon-linux-extras enables this instance
to support the MediaWiki installation and be an AWS LAM clone.

* [aws-efs-mount.bash](https://gitlab.com/aws-lam/aws/-/blob/master/aws-efs-mount.bash?ref_type=heads)
mounts the AWS LAM VPC Elastic File Systems that have been created for each region
and availability zone when avaialble.  All 32 REGIONs enabled for my AWS account,
as of January 2025, support Standard and Lifecycle Management EFS but a number of
Availability Zones including all for many REGIONs do not yet support One Zone
Lifecycle Managed EFS.

* [cloud-init.pl](https://gitlab.com/aws-lam/aws/-/blob/master/cloud-init.pl?ref_type=heads)
applies the public-hostname, public-ipv4, local-hostname and
local-ipv4 values from the /var/log/cloud-init-output.log to the
/var/www/aws/html/index.html and /var/www/aws/aws_apache2.conf files so the
Dynamic Domain Name Service page is displayed when the AWS public domain name
or IP address is visited.  The cloud-init.pl program also updates the public-ipv6
value in the VirtualHost specification of the
/var/www/&lt;site&gt;/&lt;site&gt;_apache2.conf configuration files for all the
additional-sites.

* &lt;site&gt;_apache2.conf is the site apache2 configuration file.  The LAM AWS
EC2 LAMP instance does not support .htaccess files.  The &lt;site&gt;_apache2.conf
file is linked into /etc/apache2/sites-available and then enabled with
a2ensite in the
[aws-lam-apache2-sites-configuration-Amazon-Linux.bash](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam-apache2-sites-configuration-Amazon-Linux.bash?ref_type=heads),
[aws-lam-apache2-sites-configuration-Debian-Ubuntu.bash](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam-apache2-sites-configuration-Debian-Ubuntu.bash?ref_type=heads) and
[aws-lam-apache2-sites-configuration-OpenSUSE.bash](https://gitlab.com/aws-lam/aws/-/blob/master/aws-lam-apache2-sites-configuration-OpenSUSE.bash?ref_type=heads)
script which also assign
a three digit numerical order for the sites.  Force apache2 to read any
changes in configuration files with:
<pre>systemctl daemon-reload
systemctl reload apache2</pre>

See Also:
* [no-ssl repo](https://gitlab.com/aws-lam/no-ssl/-/tree/master?ref_type=heads)
* [arsc repo](https://gitlab.com/aws-lam/arsc/-/tree/master?ref_type=heads)
* [A Cloud-init script that anyone could launch on AWS](https://lamurakami.github.io/blog/2020/08/04/Cloud-init-script-that-anyone-could-launch-on-AWS.html)
