#!/bin/bash
# /var/www/lam/iptables.bash - aws repo
#
# Firewall rules for IPv4
#
# Flush any Existing iptable Rules
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -F POSTROUTING -t nat
iptables -F PREROUTING -t nat

# Specify services we will allow
iptables -A INPUT -p tcp -s 172.31.0.0/16 --dport 22 -j ACCEPT   # sshd on standard port
iptables -A INPUT -p tcp --dport 2222 -j ACCEPT                  # sshd on alternate port
iptables -A INPUT -p tcp --dport 55520 -j ACCEPT                 # sshd on alternate port
iptables -A INPUT -p tcp --dport 80 -j ACCEPT                    # apache
iptables -A INPUT -p tcp --dport 443 -j ACCEPT                   # apache ssl
iptables -A INPUT -p tcp --dport 993 -j ACCEPT                   # imap secure
iptables -A INPUT -p tcp -s 172.31.0.0/16 --dport 2049 -j ACCEPT # NFS for EFS

iptables -A INPUT -p icmp -j ACCEPT # Internet Control Message Protocol (ICMP) Ping packets.
iptables -A INPUT -i lo -j ACCEPT # Local Loopback
iptables -A INPUT -p tcp -m tcp --tcp-flags ACK ACK -j ACCEPT

iptables -A INPUT -p udp --dport 161 -j ACCEPT # Simple Network Management Protocol (SNMP)

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A INPUT -j REJECT # Close up firewall. All else blocked

# Firewall rules for IPv6
#
# Flush any Existing iptable Rules
ip6tables -F INPUT
ip6tables -F OUTPUT
ip6tables -F FORWARD
ip6tables -F POSTROUTING -t nat
ip6tables -F PREROUTING -t nat

# Specify IPv6 CIDR blocks we will allow SSH for on the standard port
ip6tables -A INPUT -p tcp -s 2600:1f14:3d86:2c00::/56 --dport 22 -j ACCEPT   # us-west-2 Oregon LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2600:1f18:3370:6900::/56 --dport 22 -j ACCEPT   # us-east-1 N. Virginia LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2600:1f11:e3:1500::/56   --dport 22 -j ACCEPT   # ca-central-1 Canada LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2600:1f16:1e4e:7000::/56 --dport 22 -j ACCEPT   # us-east-2 Ohio LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2600:1f1c:920:e400::/56  --dport 22 -j ACCEPT   # us-west-1 N. California LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d014:3c:9000::/56   --dport 22 -j ACCEPT   # eu-central-1 Frankfurt LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d018:e47:4700::/56  --dport 22 -j ACCEPT   # eu-west-1 Ireland LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d01c:dc5:e00::/56   --dport 22 -j ACCEPT   # eu-west-2 London LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d012:faa:da00::/56  --dport 22 -j ACCEPT   # eu-west-3 Paris LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d016:6d7:ca00::/56  --dport 22 -j ACCEPT   # eu-north-1 Stockholm LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2600:1f1e:c9c:8300::/56  --dport 22 -j ACCEPT   # sa-east-1 Sao Paulo (South America) LAM AWS VPC IPv6
ip6tables -A INPUT -p tcp -s 2406:da14:f5c:c900::/56  --dport 22 -j ACCEPT   # ap-northeast-1 Tokyo LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da18:5b1:8700::/56  --dport 22 -j ACCEPT   # ap-southeast-1 Singapore LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da1c:255:a800::/56  --dport 22 -j ACCEPT   # ap-southeast-2 Sydney LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da12:e63:8e00::/56  --dport 22 -j ACCEPT   # ap-northeast-2 Seoul LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da16:57c:ed00::/56  --dport 22 -j ACCEPT   # ap-northeast-3 Osaka LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da1a:d73:6f00::/56  --dport 22 -j ACCEPT   # ap-south-1 Mumbai LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2600:1f1a:49a2:3500::/56 --dport 22 -j ACCEPT   # ca-west-1 Calgary LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da11:79f:c900::/56  --dport 22 -j ACCEPT   # af-south-1 Cape Town LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da1f:cf5:6d00::/56  --dport 22 -j ACCEPT   # ap-southeast-4 Melbourne LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d01e:ccf:6400::/56  --dport 22 -j ACCEPT   # me-south-1 Bahrain LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da17:250:5f00::/56  --dport 22 -j ACCEPT   # me-central-1 United Arab Emirates (UAE) LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d025:b2e:d900::/56  --dport 22 -j ACCEPT   # il-central-1 Tel Aviv (Israel) LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da1b:ad5:d700::/56  --dport 22 -j ACCEPT   # ap-south-2 Hyderabad (India) LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da19:cf5:dc00::/56  --dport 22 -j ACCEPT   # ap-southeast-3 Jakarta {Indonesia) LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d01a:454:b900::/56  --dport 22 -j ACCEPT   # eu-south-1 Milan (Italy) LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d011:9ab:4400::/56  --dport 22 -j ACCEPT   # eu-south-2 Spain LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a05:d019:113:7b00::/56  --dport 22 -j ACCEPT   # eu-central-2 Zurich LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da1e:ee0:4b00::/56  --dport 22 -j ACCEPT   # ap-east-1 Hong Kong LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da10:8bc3:8000::/56 --dport 22 -j ACCEPT   # ap-southeast-5 Asia Pacific (Malaysia) LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2406:da14:862d:8d00::/56 --dport 22 -j ACCEPT   # ap-aoutheast-7 Asia Pacific (Thailand) LAM AWS VPC IPv6 CIDR
ip6tables -A INPUT -p tcp -s 2a0a:d981::/64 --dport 22 -j ACCEPT # SSH from BlinkenShell

# Specify services we will allow
ip6tables -A INPUT -p tcp --dport 2222 -j ACCEPT                  # sshd on alternate port
ip6tables -A INPUT -p tcp --dport 55520 -j ACCEPT                 # sshd on alternate port
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT                    # apache
ip6tables -A INPUT -p tcp --dport 443 -j ACCEPT                   # apache ssl
ip6tables -A INPUT -p tcp --dport 993 -j ACCEPT                   # imap secure

ip6tables -A INPUT -p icmp -j ACCEPT # Internet Control Message Protocol (ICMP) Ping packets.
ip6tables -A INPUT -i lo -j ACCEPT # Local Loopback
ip6tables -A INPUT -p tcp -m tcp --tcp-flags ACK ACK -j ACCEPT

ip6tables -A INPUT -p udp --dport 161 -j ACCEPT # Simple Network Management Protocol (SNMP)

ip6tables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

ip6tables -A INPUT -j REJECT # Close up firewall. All else blocked
