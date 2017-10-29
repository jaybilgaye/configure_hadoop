#!/bin/bash

which_os
if [ "$OS" != RedHatEnterpriseServer -a "$OS" != CentOS -a "$OS" != Ubuntu ]; then
  echo "ERROR: Unsupported OS."
  exit 3
fi

if [ "$OS" == RedHatEnterpriseServer -o "$OS" == CentOS ]; then
  if [ $OSREL == 6 ]; then
    service iptables stop
    chkconfig iptables off
    service ip6tables stop
    chkconfig ip6tables off
  else
    service firewalld stop
    chkconfig firewalld off
    service iptables stop
    chkconfig iptables off
    service ip6tables stop
    chkconfig ip6tables off
  fi
elif [ "$OS" == Ubuntu ]; then
  service ufw stop
  ufw disable
elif [ "$OS" == Debian ]; then
  iptables -F
  iptables -X
  iptables -t nat -F
  iptables -t nat -X
  iptables -t mangle -F
  iptables -t mangle -X
  iptables -P INPUT ACCEPT
  iptables -P OUTPUT ACCEPT
  iptables -P FORWARD ACCEPT
fi