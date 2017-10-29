#!/bin/bash
add-apt-repository -y ppa:webupd8team/java
	    apt-get -y -qq update
	    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
	#    apt-get -y -q install oracle-java8-installer=8u91-*
	    apt-get -y -q install oracle-java8-installer
	    apt-get -y -q install oracle-java8-set-default