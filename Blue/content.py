import subprocess as sub

#-l makes line breaks, -i for interface, 
#-A for ASCII print out, -s for size (make 1500 so it doesn't cut out before packet ends), 
#dst port 80 for http incoming requests 
#, '-s', '1500','-A', 'dst', 'port', '80'

p = sub.Popen(('sudo', 'tcpdump', '-l', '-i', 'eth4'), stdout=sub.PIPE) #Subprocess tcpdump pipe output to this python script
#Content of request + who is sending
#Statistics on number of packets and bytes in TCP data, TCP SYN, UDP, ICMP, and total

for row in p.stdout:
	print row.rsplit();
# 	tokens = row.rsplit('\n')
# 	print tokens[0]
	print '-----------------------------'
	# firstline = tokens[0].split()
	# sender = firstline[2]
	# message = tokens[1]
	# print "-------"
	# print "PACKET:"
	# print firstline
	# print message
	# print "-------"