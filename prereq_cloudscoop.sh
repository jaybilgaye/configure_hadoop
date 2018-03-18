#!/bin/bash
 
setenforce 0
sed -i -e '/^SELINUX=/s|=.*|=disabled|' /etc/selinux/config
yum -y -e1 -d1 install wget unzip epel-release git curl
echo "Installing java"
#!/bin/bash
wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm -O jdk-8u131-linux-x64.rpm

rpm -Uv jdk-8u131-linux-x64.rpm

echo"Setting java home"

JAVA_HOME=/usr/java/default
cat <<EOF >/etc/profile.d/java.sh
export JAVA_HOME=$JAVA_HOME
export PATH=\$JAVA_HOME/bin:\$PATH
EOF
chown root:root /etc/profile.d/java.sh
chmod 0644 /etc/profile.d/java.sh

echo "Disable iptables"

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

#!/bin/bash

# architecture #
lscpu
lsblk
uname -a
df -h

# release #
# RHEL, CentOS
cat /etc/redhat-release
# Ubuntu
cat /etc/issue
lsb_release -a
