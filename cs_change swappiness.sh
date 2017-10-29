#!/bin/bash

VAL=1

# Function to discover basic OS details.
which_os () {
  if command -v lsb_release >/dev/null; then
    # CentOS, Ubuntu
    OS=`lsb_release -is`
    # 7.2.1511, 14.04
    OSVER=`lsb_release -rs`
    # 7, 14
    OSREL=`echo $OSVER | awk -F. '{print $1}'`
    # trusty, wheezy, Final
    OSNAME=`lsb_release -cs`
  else
    if [ -f /etc/redhat-release ]; then
      if [ -f /etc/centos-release ]; then
        OS=CentOS
      else
        OS=RedHatEnterpriseServer
      fi
      OSVER=`rpm -qf /etc/redhat-release --qf="%{VERSION}.%{RELEASE}\n"`
      OSREL=`rpm -qf /etc/redhat-release --qf="%{VERSION}\n" | awk -F. '{print $1}'`
    fi
  fi
}

# Check to see if we are on a supported OS.
which_os
if [ "$OS" != RedHatEnterpriseServer -a "$OS" != CentOS -a "$OS" != Debian -a "$OS" != Ubuntu ]; then
  echo "ERROR: Unsupported OS."
  exit 3
fi

sysctl -w vm.swappiness=$VAL

if [ "$OS" == RedHatEnterpriseServer -o "$OS" == CentOS ]; then
  if [ $OSREL == 6 ]; then
    if grep -q vm.swappiness /etc/sysctl.conf; then
      sed -i -e "/^vm.swappiness/s|=.*|= $VAL|" /etc/sysctl.conf
    else
      echo "vm.swappiness = $VAL" >>/etc/sysctl.conf
    fi
  else
    if grep -q vm.swappiness /etc/sysctl.conf; then
      sed -i -e '/^vm.swappiness/d' /etc/sysctl.conf
    fi
    install -m 0644 -o root -g root /dev/null /etc/sysctl.d/cloudera.conf
    echo "# Tuning for Hadoop installation. CLAIRVOYANT" >/etc/sysctl.d/cloudera.conf
    echo "vm.swappiness = $VAL" >>/etc/sysctl.d/cloudera.conf
  fi
elif [ "$OS" == Debian -o "$OS" == Ubuntu ]; then
  if grep -q vm.swappiness /etc/sysctl.conf; then
    sed -i -e '/^vm.swappiness/d' /etc/sysctl.conf
  fi
  install -m 0644 -o root -g root /dev/null /etc/sysctl.d/cloudera.conf
  echo "# Tuning for Hadoop installation. CLAIRVOYANT" >/etc/sysctl.d/cloudera.conf
  echo "vm.swappiness = $VAL" >>/etc/sysctl.d/cloudera.conf
fi