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
