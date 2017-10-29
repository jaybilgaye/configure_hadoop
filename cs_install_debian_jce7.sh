#!/bin/bash

if dpkg -l oracle-j2sdk1.7 >/dev/null || test -d /usr/lib/jvm/java-7-oracle-cloudera; then
	    wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	      http://download.oracle.com/otn-pub/java/jce/7/UnlimitedJCEPolicyJDK7.zip -O /tmp/jce_policy-7.zip
	    unzip -o -j /tmp/jce_policy-7.zip -d /usr/lib/jvm/java-7-oracle-cloudera/jre/lib/security/
	  fi


	  if dpkg -l oracle-java7-installer >/dev/null || test -d /usr/lib/jvm/java-7-oracle; then
	    apt-get -y -q install oracle-java7-unlimited-jce-policy
	  fi
