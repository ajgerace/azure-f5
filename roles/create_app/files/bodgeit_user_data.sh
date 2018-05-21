#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install tomcat7 samba krb5-user krb5-config
wget https://github.com/psiinon/bodgeit/releases/download/1.4.0/bodgeit.war
mv bodgeit.war /var/lib/tomcat7/webapps
service tomcat7 restart
systemctl stop samba-ad-dc.service smbd.service
systemctl disable samba-ad-dc.service smbd.service
mv /etc/samba/smb.conf /etc/samba/smb.conf.initial
samba-tool domain provision --use-rfc2307 --realm=f5demo.org --domain=f5demo --adminpass=f5N3tw0rk$ --server-role=dc --dns-backend=SAMBA_INTERNAL
systemctl start samba-ad-dc.service smbd.service
systemctl enable samba-ad-dc.service smbd.service
samba-tool user create user1  Agility1 --given-name=Test1 --surname=User --mail-address=user1@f5demo.org
samba-tool user create user2  Agility2 --given-name=Test2 --surname=User --mail-address=user2@f5demo.org
