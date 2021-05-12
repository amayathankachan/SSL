#!/bin/bash
# Alert once SSL certificate expires
# -------------------------------------------------------------------------------
DOM="teistafoods.com"
PORT="443"


DAYS=`date -d "+30 days"`

# Email settings
_sub="SSL certificate of $DOM will expire within $DAYS "
_from="amayaparunthaniyil555@gmail.com"
_to="amaya_thankachan@yahoo.com"
Certexp=`openssl s_client -servername $DOM -connect $DOM:$PORT | openssl x509 -enddate -noout`

# Send email
if [ "$Certexp" = "$DAYS" ]
#if [ $? -eq 0 ]
then
echo "${_sub}"
      mail -s "$_sub" -r "$_from" "$_to" <<< "SSL certificate ($DOM) will expire soon on[$(date)]"
fi
