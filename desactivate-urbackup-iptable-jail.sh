#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

sed -i 's/^enabled.*/enabled = false/' /etc/fail2ban/jail.d/urbackup.conf
echo "urbackup IPTable jail disabled"

fail2ban-client reload
fail2ban-client status

