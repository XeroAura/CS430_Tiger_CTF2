#!/bin/bash

echo -n "Starting firewall: "
IPTABLES="/sbin/iptables" # path to iptables
$IPTABLES --flush

ETH="eth0"

$IPTABLES -A INPUT -i lo -j ACCEPT
$IPTABLES -A OUTPUT -o lo -j ACCEPT
$IPTABLES -t filter -i $ETH -A INPUT -m state --state ESTABLISHED -j ACCEPT
$IPTABLES -t filter -o $ETH -A OUTPUT -m state --state ESTABLISHED -j ACCEPT

$IPTABLES -A INPUT  -i $ETH -s server -j DROP
$IPTABLES -A INPUT  -i $ETH -p tcp --dport 80 -m state --state NEW -j ACCEPT

$IPTABLES -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

$IPTABLES -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT


$IPTABLES -A OUTPUT -o $ETH -j DROP
$IPTABLES -A INPUT -i $ETH -j DROP

echo "done."
