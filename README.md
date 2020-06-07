# Description :
Urbackup is a very powerful file and disk image backup solution. It exposes on the internet several ports necessary for communication with client modules and for displaying the administration web interface.
As such, it may be the subject of a DDos type attack or password cracking by Brut force.

Fail2ban is a server application that allows you to read its event logs and find traces of connection errors corresponding to these potential attacks.

The association of Fail2ban with Urbackup seems to me to be a simple and effective solution to protect its server. I propose the configuration files (jail, filter and actions) that I am putting in place on my own servers. So it's something under construction, so do not hesitate to comment, suggest improvements, give your feedback.


# Some commands :
##TEST a Regex ##
fail2ban-regex /var/log/auth.log /etc/fail2ban/filter.d/urbackup.rule.conf

## CHECK banned client ##
sudo fail2ban-client status urbackup

## Unban IP ##
fail2ban-client set urbackup unbanip [IP]


#  More information : 
## Used Regex
Example of event : Apr  5 18:20:17 SRV-URB-LX2 urbackupsrv: Authentication failure for toto from 12.34.56.78 via web interface
failregex = .* urbackupsrv: Authentication failure for .* from <HOST> .*
  
## Ports exposed by Urbackup
55413 URB-FastCGI
55414 URB-HTTP (protect by Fail2ban)
55415 URB-InternetClient


###### TODO  #####
Add filter to find connection error for URB-FastCGI and URB-InternetClient
Add jail to protect URB-FastCGI and URB-InternetClient
Add a filter or specific action with application name for use generic action UFW
