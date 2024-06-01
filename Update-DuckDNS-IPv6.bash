#!/bin/bash

# Update-DuckDNS-IPv6.bash # 1=name

if [ -z $1 ] ; then
  echo "One argument needed!"
  echo "Usage: $0 <Subdomain>"
  exit 1;
fi

Subdomain=$1

IPv6_Address=$(ip a | grep inet6 \
| grep 'scope global dynamic' | awk '{print $2;}' \
| sed 's|/128||' | tr -d '\n')

ssh aws "/var/www/aws/Update-DuckDNS-IPv6-from-IPv4.bash \
${Subdomain} ${IPv6_Address}"
