#!/usr/bin/bash
# Update-Dynu-FreeDDNS.bash

if [ -z $1 ] ; then
  echo "One argument needed!"
  echo "Usage: $0 <Subdomain>"
  exit 1;
fi

Subdomain=$1

# Setup the ~/.dynu-password
cp /home/lam/.dynu-password .

if [[ ${Public_IPv4} == 'none' ]] ; then
  echo 'Public_IPv4=none'
else

echo url="https://api-ipv4.dynu.com/nic/update?username=LAMurakami&password=$(cat \
~/.dynu-password)&hostname=${Subdomain}.freeddns.org"\
| curl -k -K -; echo " IPv4 address update for ${Subdomain}.freeddns.org" ; echo

fi

echo url="https://api-ipv6.dynu.com/nic/update?username=LAMurakami&password=$(cat \
~/.dynu-password)&hostname=${Subdomain}.freeddns.org"| curl -k -K -; echo \
" IPv6 address update for ${Subdomain}.freeddns.org" ; echo
