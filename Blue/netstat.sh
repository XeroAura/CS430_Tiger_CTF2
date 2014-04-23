#!/bin/bash
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
#this script prints out the number of connections to this server
#addresses with really high number of connections could be attackers
#after a connection is closed it still shows up for like 20 seconds
#so the legitimate server shouldnt have more than 25 connections or so
