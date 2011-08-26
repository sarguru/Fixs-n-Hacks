#!/bin/sh
echo "uid,cn,empid,uidNumber,mail" > users-group.csv
echo " " >> users-group.csv

for i in `ldapsearch -xD "LDAP BIND DN" -w"LDAP BIND PW" -b "LDAP SEARCH BASE" "cn=$1" memberUid| grep memberUid| cut -d':' -f2`; do ./ldapsearch.pl $i; done

