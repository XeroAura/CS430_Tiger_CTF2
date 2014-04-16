import subprocess as sub

interface = 'eth0'
arguments = '-l -i ' + interface + ' -A -s 1500 dst port 80' #-l makes line breaks, -i for interface, -A for ASCII print out, -s for size (make 1500 so it doesn't cut out), dst port 80 for http incoming requests
p = sub.Popen(('sudo', 'tcpdump', arguments), stdout=sub.PIPE) #Subprocess tcpdump pipe output to this python script

try:
    for row in p.stdout:
        print row.rstrip()   # process here