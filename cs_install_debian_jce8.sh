#!/bin/bash
	  if dpkg -l oracle-java8-installer >/dev/null || test -d /usr/lib/jvm/java-8-oracle; then
	    apt-get -y -q install oracle-java8-unlimited-jce-policy
	  fi
