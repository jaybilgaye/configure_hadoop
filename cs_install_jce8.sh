#!/bin/bash
	  if rpm -q oracle-j2sdk1.8 || test -d /usr/java/jdk1.8.0_*; then
	    wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	      http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip -O /tmp/jce_policy-8.zip
	    unzip -o -j /tmp/jce_policy-8.zip -d /usr/java/jdk1.8.0_*/jre/lib/security/
	  fi