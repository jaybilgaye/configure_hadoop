#!/bin/bash
 
 setenforce 0
  sed -i -e '/^SELINUX=/s|=.*|=disabled|' /etc/selinux/config