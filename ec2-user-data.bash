#!/usr/bin/bash
printf "ami-id: %s\n" $(curl -s http://169.254.169.254/latest/meta-data/ami-id)
printf "instance-type: %s\n" $(curl -s http://169.254.169.254/latest/meta-data/instance-type)
printf "local-hostname: %s\n" $(curl -s http://169.254.169.254/latest/meta-data/local-hostname)
printf "local-ipv4: %s\n" $(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
printf "public-hostname: %s\n" $(curl -s http://169.254.169.254/latest/meta-data/public-hostname)
printf "public-ipv4: %s\n" $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
printf "security-groups: %s\n" $(curl -s http://169.254.169.254/latest/meta-data/security-groups)
