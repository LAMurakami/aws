#!/usr/bin/bash
# Update-DuckDNS.bash
# Uses ${Public_IPv4} exported in parent process

if [ -z $1 ] ; then
  echo "One argument needed!"
  echo "Usage: $0 <Subdomain>"
  exit 1;
fi

Subdomain=$1

IPv6_Address=$(ip a | grep inet6 \
| grep 'scope global dynamic' | awk '{print $2;}' \
| sed 's|/.*||' | tr -d '\n')

if [[ ${Public_IPv4} == 'none' ]] ; then
 ssh aws "/var/www/aws/Update-DuckDNS-IPv6-from-IPv4.bash \
   ${Subdomain} ${IPv6_Address}"

else
 echo url="https://www.duckdns.org/update?domains=$1&token=$(cat \
 ~/.duckdns)&verbose=true&ip="| curl -s -k -K -; echo \
 " for $1.duckdns.org IP address update" ; echo

 echo url="https://www.duckdns.org/update?domains=$1&token=$(cat \
 ~/.duckdns)&verbose=true&ip=&ipv6=${IPv6_Address}"| curl -s -k -K -; echo \
 " for $1.duckdns.org IP address update" ; echo
fi
