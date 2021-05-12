#!/bin/bash
# Purpose: Alert sysadmin/developer about the TLS/SSL cert expiry date in advance
# -------------------------------------------------------------------------------
DOM="teistafoods.com"
PORT="443"

# 7 days in seconds 
DAYS="604800" 
 
# Email settings 
_sub="$DOM will expire within $DAYS (7 days)."
_from="amayaparunthaniyil555@gmail.com"
_to="amaya_thankachan@yahoo.com"
#openssl="/usr/local/src/"
openssl s_client -servername $DOM -connect $DOM:$PORT | openssl x509 -enddate -noout  
 
# Send email and push message to my mobile
if [ $? -eq 0 ]
then
	echo "${_sub}"
        mail -s "$_sub" -r "$_from" "$_to" <<< "SSL certificate ($DOM) will expire soon on [$(date)]"
fi        
