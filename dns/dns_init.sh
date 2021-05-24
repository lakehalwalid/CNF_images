#!/bin/bash

cp /mnt/dns/dnsmasq.conf /etc/

DNS_IP=$1
PCSCF_IP=$2
ICSCF_IP=$3
SCSCF_IP=$4
FHOSS_IP=$5

sed -i 's|DNS_IP|'$DNS_IP'|g' /etc/dnsmasq.conf
sed -i 's|PCSCF_IP|'$PCSCF_IP'|g' /etc/dnsmasq.conf
sed -i 's|ICSCF_IP|'$ICSCF_IP'|g' /etc/dnsmasq.conf
sed -i 's|SCSCF_IP|'$SCSCF_IP'|g' /etc/dnsmasq.conf
sed -i 's|FHOSS_IP|'$FHOSS_IP'|g' /etc/dnsmasq.conf

/usr/sbin/dnsmasq -d
