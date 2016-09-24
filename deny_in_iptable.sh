#!/bin/bash
if iptables -A INPUT -s $1 -j DROP
then echo "[`date`] IP Address $1 blocked in IPTABLES"
service iptables save &> /dev/null 
fi
