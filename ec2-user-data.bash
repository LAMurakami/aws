#!/usr/bin/bash
#
# This program lists name value pairs separated by a colon.
# The program runs during the initialization specified in a cloud-config YAML
#  file or document supplied when the instance is launched.
# It uses Instance Metadata Service Version 2 (IMDSv2) session-oriented
#  requests to retrieve the ami-id, instance-type, local-hostname, local-ipv4,
#  public-hostname, public-ipv4, and security-groups values from the IMDS
#  available to an AWS EC2 instance.
# Updated to v2 of IMDS from v1 which did not need to establish a session
#  for a request/response to accomodate Amazon Linux 2023 instances
#  which requires v2 in the default AMIs supplied by Amazon.
#
# Establish a 6 hour session which is so much more than we need for this.
#
TOKEN=$(curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
#
# List name / value pairs for this instance on separate lines.
#
printf "ami-id: %s\n" $(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data//ami-id)
printf "instance-type: %s\n" $(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data//instance-type)
printf "local-hostname: %s\n" $(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data//local-hostname)
printf "local-ipv4: %s\n" $(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)
printf "public-hostname: %s\n" $(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-hostname)
printf "public-ipv4: %s\n" $(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)
printf "security-groups: %s\n" $(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/security-groups)
