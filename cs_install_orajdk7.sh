#!/bin/bash
wget -c --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	      http://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-linux-x64.rpm -O jdk-7u80-linux-x64.rpm
	    rpm -Uv jdk-7u80-linux-x64.rpm
