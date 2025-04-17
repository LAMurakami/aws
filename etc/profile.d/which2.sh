# /etc/profile.d/which2.sh # /var/www/aws/etc/profile.d/which2.sh
# A modified version of what is on a Fedora 42 system using GNU which
# shellcheck shell=sh
# Initialization script for bash, sh, zsh, mksh and ksh

case "$(basename $(readlink /proc/$$/exe))" in
*ksh*|zsh)
    alias which='alias | /usr/local/bin/which --tty-only --read-alias --show-tilde --show-dot'
    ;;
sh)
    alias which='(alias; declare -f) | /usr/local/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'
    ;;
bash)
    which ()
    {
      (alias; declare -f) | /usr/local/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot "$@"
    }
    export -f which
    ;;
*)
    ;;
esac
