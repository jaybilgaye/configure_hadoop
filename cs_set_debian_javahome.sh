#!/bin/bash
 if ! grep -q JAVA_HOME /etc/profile.d/*; then
	    JAVA_HOME=`dpkg -L oracle-j2sdk1.7|grep /usr/lib/jvm/java|head -1`


	    cat <<EOF >/etc/profile.d/java.sh
	export JAVA_HOME=$JAVA_HOME
	export PATH=\$JAVA_HOME/bin:\$PATH