#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install tomcat7
wget https://github.com/psiinon/bodgeit/releases/download/1.4.0/bodgeit.war
mv bodgeit.war /var/lib/tomcat7/webapps
service tomcat7 restart