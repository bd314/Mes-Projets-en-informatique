import sys, os
#need lib-cec to work
#https://github.com/Pulse-Eight/libcec/wiki/Raspberry-Pi-set-up

if sys.argv[1]=="on": #turn on samsung-tv
    os.system(' echo "on 0" | cec-client -s')
elif sys.argv[1]=="off": #turn off samsung-tv
    os.system('echo "standby 0" | cec-client -s')
else:
    print("Not a valid choice.")
