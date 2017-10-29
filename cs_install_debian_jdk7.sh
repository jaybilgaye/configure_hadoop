#!/bin/bash
add-apt-repository -y ppa:webupd8team/java
	    apt-get -y -qq update
	    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
	#    apt-get -y -q install oracle-java7-installer=7u80-*
	    apt-get -y -q install oracle-java7-installer
	    apt-get -y -q install oracle-java7-set-default