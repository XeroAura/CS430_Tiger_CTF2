import subprocess as sub

#-l makes line breaks, -i for interface, 
#-A for ASCII print out, -s for size (make 1500 so it doesn't cut out before packet ends)

p = sub.Popen(('sudo', 'tcpdump', '-l', '-i', 'eth3', '-A', '-s', '0', 'dst', '5.6.7.8', 'and', '(tcp', 'or', 'udp', 'or', 'icmp)'), stdout=sub.PIPE)

tcp_pak = 0;
tcp_size = 0;
tcpsyn_pak = 0;
tcpsyn_size = 0;
icmp_pak = 0;
icmp_size = 0;
udp_pak = 0;
udp_size = 0;
total_pak = 0;
total_size = 0;

stats = open("stats.txt", "a+")

for row in iter(p.stdout.readline, ''):
	tokens = row.rsplit()
	if len(tokens) >= 6:
		if tokens[1] == 'IP': #Packet header instead of content
			if tokens[5] == 'Flags': #TCP

				if 'S' in tokens[6]:
					print('--------------------------------------------')
					tcpsyn_pak = tcpsyn_pak + 1
					total_pak = total_pak + 1
					if tokens[-2] == 'length':
						tcpsyn_size = tcpsyn_size + int(tokens[-1])
						total_size = total_size + int(tokens[-1])
					stats.write("Sender: " + tokens[2])
					stats.write("TCP SYN: " + tcpsyn_pak + "	SYN SIZE: " + tcpsyn_size + "\n")
					stats.write("Total Packets: " + total_pak + "	Total Size: " + total_size + "\n")

				else:
					print ('--------------------------------------------')
					tcp_pak = tcp_pak + 1
					total_pak = total_pak + 1
					if tokens[-2] == 'length':
						tcp_size = tcp_size + int(tokens[-1])
						total_size = total_size + int(tokens[-1])
					stats.write("Sender: " + tokens[2])
					stats.write("TCP: " + tcpsyn_pak + "	TCP SIZE: " + tcpsyn_size + "\n")
					stats.write("Total Packets: " + total_pak + "	Total Size: " + total_size + "\n")

			elif tokens[5] == 'ICMP': #ICMP
				print ('--------------------------------------------')
				icmp_pak = icmp_pak + 1
				total_pak = total_pak + 1
				if tokens[-2] == 'length':
					icmp_size = icmp_size + int(tokens[-1])
					total_size = total_size + int(tokens[-1])
				stats.write("Sender: " + tokens[2])
				stats.write("ICMP: " + tcpsyn_pak + "	ICMP SIZE: " + tcpsyn_size + "\n")
				stats.write("Total Packets: " + total_pak + "	Total Size: " + total_size + "\n")

			elif tokens[5] == 'SIP': #UDP
				print ('--------------------------------------------')
				udp_pak = udp_pak + 1
				if tokens[-2] == 'length':
					total_pak = total_pak + 1
					udp_size = udp_size + int(tokens[-1])
					total_size = total_size + int(tokens[-1])
				stats.write("Sender: " + tokens[2])
				stats.write("UDP: " + tcpsyn_pak + "	UDP SIZE: " + tcpsyn_size + "\n")
				stats.write("Total Packets: " + total_pak + "	Total Size: " + total_size + "\n")

			else:
				print (row)

		else:
			print (row)

	else:
		print (row)

	'''
	#Content of request + who is sending
	#Statistics on number of packets and bytes in TCP data, TCP SYN, UDP, ICMP, and total

	PING:
	11:23:42.702767 IP server-link1 > client-lan1: ICMP echo reply, id 40714, seq 1, length 64

	WEB:

	11:27:02.848445 IP client-lan1.49820 > server-link1.www: Flags [.], ack 6363, win 318, options [nop,nop,TS val 130593 ecr 131020], length 0
	11:27:02.845857 IP client-lan1.49820 > server-link1.www: Flags [P.], seq 1:117, ack 1, win 92, options [nop,nop,TS val 130593 ecr 131020], length 116
	11:26:57.840962 IP client-lan1.49819 > server-link1.www: Flags [F.], seq 117, ack 3741, win 227, options [nop,nop,TS val 129341 ecr 129768], length 0

	sudo apt-get install sendip
	sendip -p ipv4 -is server -p udp -us 5070 -ud 5060 -d "Hello" -v server
	UDP:
	13:00:29.709804 IP 255.255.255.255.5070 > server-link0.sip: SIP, length: 5

	'''