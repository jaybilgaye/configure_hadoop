#!/bin/bash
JAVA_HOME=/usr/java/default


	  cat <<EOF >/etc/profile.d/java.sh
	export JAVA_HOME=$JAVA_HOME
	export PATH=\$JAVA_HOME/bin:\$PATH
	EOF
	  chown root:root /etc/profile.d/java.sh
	  chmod 0644 /etc/profile.d/java.sh
