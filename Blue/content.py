import subprocess as sub

interface = 'eth0';

arguments = '-l -i  -A -s 1500 dst port 80';

p = sub.Popen(('sudo', 'tcpdump', arguments), stdout=sub.PIPE)
try:
    for row in p.stdout:
        print row.rstrip()   # process here
except KeyboardInterrupt:
    p.terminate()            # zombie protection, if needed