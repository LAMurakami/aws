#!/bin/bash

if [ -z $1 ] ; then
  echo "Subdomain for ?.duckdns.org needed!" && exit 1;
fi

echo url="https://www.duckdns.org/update?domains=$1&token=$(cat \
~/.duckdns)&verbose=true&ip="| curl -s -k -K -; echo \
" for $1.duckdns.org IP address update" ; echo

IPv6_Address=$(ip a | grep inet6 \
| grep 'scope global dynamic' | awk '{print $2;}' \
| sed 's|/.*||' | tr -d '\n')

echo url="https://www.duckdns.org/update?domains=$1&token=$(cat \
~/.duckdns)&verbose=true&ip=&ipv6=${IPv6_Address}"| curl -s -k -K -; echo \
" for $1.duckdns.org IP address update" ; echo

