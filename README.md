# URB_Fail2ban
URBackup Rule for Fail2ban


###### TEST #####
fail2ban-regex /var/log/auth.log /etc/fail2ban/filter.d/urbackup.rule.conf

###### CHECK banned client #####
sudo fail2ban-client status urbackup

###### Unban IP #####
fail2ban-client set urbackup unbanip [IP]

##### USED REGEX ####
#Apr  5 18:20:17 SRV-URB-LX2 urbackupsrv: Authentication failure for toto from 12.34.56.78 via web interface
failregex = .* urbackupsrv: Authentication failure for .* from <HOST> .*
