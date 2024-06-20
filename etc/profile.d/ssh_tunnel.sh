# /etc/profile.d/ssh_tunnel.sh
alias sp='ssh -f -C2qTnN -D 1080'
alias rp='ps -ef | grep "ssh -f" | grep -v grep'
alias st='ssh -f -C2qTnN'
