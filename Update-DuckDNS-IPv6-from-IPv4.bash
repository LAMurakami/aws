#!/bin/bash

# /var/www/aws/Update-DuckDNS-IPv6-from-IPv4.bash # 1=name 2=IPv6 address

if [ -z $2 ] ; then
  echo "Two arguments needed!"
  echo "Usage: $0 <Subdomain> <IPv6_Address>"
  exit 1;
fi

Subdomain=$1
IPv6_Address=$2

echo url="https://www.duckdns.org/update?domains=${Subdomain}&token=$(cat \
~/.duckdns)&verbose=true&ip=&ipv6=${IPv6_Address}"| curl -s -k -K -; echo \
" for ${Subdomain}.duckdns.org IP address update" ; echo

