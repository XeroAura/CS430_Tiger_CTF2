#!/bin/bash
echo -n "Starting firewall: "
IPTABLES="/sbin/iptables" 
$IPTABLES --flush

ETH="eth2"
$IPTABLES -P FORWARD DROP
$IPTABLES -A INPUT -i lo -j ACCEPT
$IPTABLES -A OUTPUT -o lo -j ACCEPT
#$IPTABLES -t filter -i $ETH -A INPUT -m state --state ESTABLISHED -j ACCEPT
#$IPTABLES -t filter -o $ETH -A OUTPUT -m state --state ESTABLISHED -j ACCEPT
#$IPTABLES -t filter -A FORWARD -m state --state ESTABLISHED -j ACCEPT

#$IPTABLES -A INPUT  -i $ETH -s gateway -j DROP
$IPTABLES -A FORWARD  -p tcp --dport 80 -d server -j ACCEPT
#$IPTABLES -A FORWARD -o $ETH -p tcp -s server -j ACCEPT
$IPTABLES -A FORWARD  -p tcp -s server -j ACCEPT

$IPTABLES -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
#below rule filters based on ttl
#$IPTABLES -A FORWARD -p tcp -m ttl --ttl-eq=x -j DROP
#below rule filters based on length
#$IPTABLES -A FORWARD -p tcp -m length -length length -j DROP
#below rule only allows 15 connections per second from the specified client1
#$IPTABLES -A FORWARD -p tcp -m limit --limit 15/s -s client1 -j ACCEPT

# *IGNORE* all other traffic
$IPTABLES -A OUTPUT -o $ETH -j DROP
$IPTABLES -A INPUT -i $ETH -j DROP

echo "done."
