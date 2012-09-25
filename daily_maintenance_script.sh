#!/bin/bash

############################
# Date string for root mails
# Date format: day - month - year

DATE=`date +%d_%m_%y`

############################
# Archive root mails
# Copy mails to "/root/mails" and delete "/var/mail/root"

cp /var/mail/root /root/mails/root_$DATE
rm /var/mail/root

############################
# Set permissions
# chmod / chown to files or folders

chown -R client2:users /var/www/client2
chmod 755 /var/www/client2

############################
# Delete old files
# Find old files and delete them

find /srv/backups/html -mtime +30 -exec rm {} \;

############################
# Clean bash history 
# Clear ".bash_history"

history -c

############################
# Restart services
# Restarting services

service apache2 restart
service mysql restart

############################
# Deny ping response
# Set 1 to "icmp_echo_ignore_all"

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all

############################
# APT Options
# update, upgrade, a.s.o

apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoclean
apt-get clean
apt-get autoremove -y

############################
# Clear system cache
# Drop system cache: 3, 2 or 1

sync; echo 3 > /proc/sys/vm/drop_caches

############################
# Daily Maintenance Script 1.0.2 (21.07.2012)
# (c) 2012 by Daniel "LWS" Nimmervoll
# www.nimmervoll.eu / debian.nimmervoll.eu
# daniel@nimmervoll.eu