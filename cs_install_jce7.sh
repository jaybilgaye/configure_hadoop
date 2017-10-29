#!/bin/bash

  if rpm -q oracle-j2sdk1.7 || test -d /usr/java/jdk1.7.0_*; then
	    wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	      http://download.oracle.com/otn-pub/java/jce/7/UnlimitedJCEPolicyJDK7.zip -O /tmp/jce_policy-7.zip
	    unzip -o -j /tmp/jce_policy-7.zip -d /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/
	  fi
