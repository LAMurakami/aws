Linux Apache MariaDB in the cloud
accessed by IP Address website for the
[lamurakami.duckdns.org](http://lamurakami.duckdns.org/)
[lam1.duckdns.org](http://lam1.duckdns.org/)
[lam2.duckdns.org](http://lam2.duckdns.org/)
[larryforalaska.duckdns.org](http://larryforalaska.duckdns.org/)
Dynamic Domain Name Service subdomains possibly being served by the instance.

This repo contains content in the html folder and an apache2 configuration
that can be implemented with:

 sudo ln -s /var/www/aws/aws_apache2.conf \
 /etc/apache2/sites-available/080_aws.conf

 sudo a2ensite 080_aws
 sudo systemctl reload apache2

If the repo contents are installed in a location other than /var/www
the path in the configuration and in the instuctions would have to be modified.

The aws_archive_rebuild.bash script will Rebuild an archive of /var/www/aws
resources when they change.  It is intended to be run daily with:

 ln -s /var/www/aws/aws_archive_rebuild.bash /mnt/efs/aws-lam1-ubuntu/aws

This would then be picked up by the Daily cron job to backup
/mnt/efs/aws-lam1-ubuntu archives.

 $ cat /etc/cron.daily/Bk-20-aws-changes
 #!/bin/bash
 run-parts --report /mnt/efs/aws-lam1-ubuntu
 [19:34:30 Sunday 06/14/2020] ubuntu@aws

A new instance can be launched from the command line with the following:

 aws ec2 run-instances --count 1 --image-id ami-003634241a8fcdec0 \
 --instance-type t3.nano --security-group-ids sg-3bda0647 \
 --associate-public-ip-address --key-name aws-nwo-lam1 --user-data \
 file:///var/www/aws/aws-nwo-lam1-Ubuntu-CloudInit.txt

The CloudInit includes a call to and cloud-init.pl which updates
/var/www/aws/html/index.html and /var/www/aws/aws_apache2.conf
based on some /var/log/cloud-init-output.log values generated
by /var/www/aws/aws-nwo-lam1-Ubuntu-CloudInit.txt directives.

