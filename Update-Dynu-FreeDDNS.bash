#!/usr/bin/bash
# Update-Dynu-FreeDDNS.bash

if [ -z $1 ] ; then
  echo "One argument needed!"
  echo "Usage: $0 <Subdomain>"
  exit 1;
fi

Subdomain=$1

# For now we will setup the ~/.dynu-password
scp aws:~/.dynu-password ~

IPv6_Address=$(ip a | grep inet6 \
| grep 'scope global dynamic' | awk '{print $2;}' \
| sed 's|/.*||' | tr -d '\n')

if [[ ${Public_IPv4} == 'none' ]] ; then
  echo 'Public_IPv4=none'
else

echo url="https://api.dynu.com/nic/update?username=LAMurakami&password=$(cat \
~/.dynu-password)&hostname=${Subdomain}.freeddns.org&myip=${Public_IPv4}"\
| curl -k -K -; echo " IPv4 address update for ${Subdomain}.freeddns.org" ; echo

fi

echo url="https://api.dynu.com/nic/update?username=LAMurakami&password=$(cat \
~/.dynu-password)&hostname=${Subdomain}.freeddns.org&myip=no\
&myipv6=${IPv6_Address}"| curl -k -K -; echo \
" IPv6 address update for ${Subdomain}.freeddns.org" ; echo
