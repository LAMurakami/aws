#!/usr/bin/perl

# This program lists name value pairs separated by an equal sign (=).
# The program runs during the initialization specified in a cloud-config YAML
#  file or document supplied when the instance is launched.
# It uses Instance Metadata Service Version 2 (IMDSv2) session-oriented
#  requests to retrieve the ami-id, instance-type, local-hostname, local-ipv4,
#  public-hostname, public-ipv4, and security-groups values from the IMDS
#  available to an AWS EC2 instance.
#
# Establish a 6 hour session which is so much more than we need for this

use strict;
use warnings;

my $TOKEN = qx(curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600");

my $ami_id = qx(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/ami-id);
 print 'ami-id = ', $ami_id, "\n";

my $instance_type = qx(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-type);
 print 'instance-type = ', $instance_type, "\n";

my $local_hostname = qx(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-hostname);
 print 'local-hostname = ', $local_hostname, "\n";

my $local_ipv4 = qx(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4);
 print 'local-ipv4 = ', $local_ipv4, "\n";

my $public_hostname = qx(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-hostname);

my $public_ipv4 = qx(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4);

if($public_ipv4 =~ /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/){
 print 'public-hostname = ', $public_hostname, "\n";
 print 'public-ipv4 = ', $public_ipv4, "\n"
}else{
 print 'public-hostname = ', 'none', "\n";
 print 'public-ipv4 = ', 'none', "\n"
}

my $security_groups = qx(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/security-groups);
 print 'security-groups = ', $security_groups, "\n";

my $availability_zone = qx(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/availability-zone);
 print 'availability-zone = ', $availability_zone, "\n";

my $public_ipv6 = qx(ip a | grep inet6 | grep 'scope global dynamic' | awk '{print \$2;}' | sed 's|/128||');
 print 'public-ipv6 = ', $public_ipv6, "\n";
