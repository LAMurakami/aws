#!/usr/bin/bash

/var/www/aws/sshd_config-add-port-443.sed /etc/ssh/sshd_config >> /tmp/sshd_config
cp /tmp/sshd_config /etc/ssh/sshd_config
rm /tmp/sshd_config
