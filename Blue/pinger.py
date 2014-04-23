
import time
import os
import sys

while True:
    PingFile = os.popen('ping -c 1 server -w 1')
    PingData = PingFile.readlines()
    PingFile.close()
    if len(PingData) < 2:
        # Failed to find a DNS resolution or route
        failed = True
        latency = 0
    else:
        index = PingData[1].find('time=')
        if index == -1:
            # Ping failed or timed-out
            failed = True
            latency = 0
        else:
            # We have a ping time, isolate it and convert to a number
            failed = False
            latency = PingData[1][index + 5:]
            latency = latency[:latency.find(' ')]
            latency = float(latency)
    # Set our outputs
    print (time.strftime("%H:%M:%S")),
    if failed:
        print("Ping timed out (took longer than 1 second)")
    else:
        # Ping stored in latency in milliseconds
        print("%f ms   " % (latency))
    time.sleep(.5)
