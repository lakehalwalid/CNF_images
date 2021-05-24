#!/bin/bash
MYSQL_IP=$1
PCSCF_IP=$2
RTPENGINE_IP=$3
DNS_IP=$4

while true; do
	echo 'Waiting for MySQL to start.'
	echo '' | nc -w 1 $MYSQL_IP 3306 && break
	sleep 1
done

sed -i 's|PCSCF_IP|'$PCSCF_IP'|g' /etc/kamailio_pcscf/kamailio_pcscf.cfg
sed -i 's|RTPENGINE_IP|'$RTPENGINE_IP'|g' /etc/kamailio_pcscf/kamailio_pcscf.cfg
sed -i 's|PCSCF_IP|'$PCSCF_IP'|g' /etc/kamailio_pcscf/pcscf.cfg
sed -i 's|MYSQL_IP|'$MYSQL_IP'|g' /etc/kamailio_pcscf/pcscf.cfg
sed -i 's|PCSCF_IP|'$PCSCF_IP'|g' /etc/kamailio_pcscf/pcscf.xml

echo "nameserver "$DNS_IP" " > /etc/resolv.conf
echo "search ims.mnc001.mcc001.3gppnetwork.org" >> /etc/resolv.conf

/etc/init.d/kamailio_pcscf start
