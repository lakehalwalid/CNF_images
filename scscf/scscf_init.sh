#!/bin/bash
MYSQL_IP=$1
FHOSS_IP=$2
SCSCF_IP=$3
DNS_IP=$4

while true; do
	echo 'Waiting for MySQL to start.'
	echo '' | nc -w 1 $MYSQL_IP 3306 && break
	sleep 1
done

while true; do
	echo 'Waiting for FHoSS to start.'
	echo '' | nc -w 1 $FHOSS_IP 3868 && break
	sleep 1
done


sed -i 's|SCSCF_IP|'$SCSCF_IP'|g' /etc/kamailio_scscf/kamailio_scscf.cfg
sed -i 's|SCSCF_IP|'$SCSCF_IP'|g' /etc/kamailio_scscf/scscf.cfg
sed -i 's|MYSQL_IP|'$MYSQL_IP'|g' /etc/kamailio_scscf/scscf.cfg
sed -i 's|SCSCF_IP|'$SCSCF_IP'|g' /etc/kamailio_scscf/scscf.xml

echo "nameserver "$DNS_IP" " > /etc/resolv.conf
echo "search  ims.mnc001.mcc001.3gppnetwork.org" >>/etc/resolv.conf

/etc/init.d/kamailio_scscf start
