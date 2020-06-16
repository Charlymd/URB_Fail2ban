#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

cp jail.d/urbackup.conf /etc/fail2ban/jail.d/

cp action.d/urbackup.conf /etc/fail2ban/action.d/

cp filter.d/urbackup.conf /etc/fail2ban/filter.d/

# set enabled = true
sed -i 's/^enabled.*/enabled = true/' /etc/fail2ban/jail.d/urbackup.conf

fail2ban-client reload
fail2ban-client status
