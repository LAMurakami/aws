#!/usr/bin/bash
#
# This program lists the user-data used for initialization.
# The program runs during the initialization specified in a cloud-config YAML
#  file or document supplied when the instance is launched.
# It uses Instance Metadata Service Version 2 (IMDSv2) session-oriented
#  requests to retrieve the instance-id value from the IMDS
#  available to an AWS EC2 instance.
# Updated to v2 of IMDS from v1 which did not need to establish a session
#  for a request/response to accomodate Amazon Linux 2023 instances
#  which requires v2 in the default AMIs supplied by Amazon.
#
# Establish a 6 hour session which is so much more than we need for this.
#
TOKEN=$(curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)

# List cloud-config YAML user-data used for initialization of this instance
#
cat /var/lib/cloud/instances/${INSTANCE_ID}/user-data.txt
