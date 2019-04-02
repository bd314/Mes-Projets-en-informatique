import sys, os
if sys.argv[1]=="on":
    os.system(' echo "on 0" | cec-client -s')
elif sys.argv[1]=="off":
    os.system('echo "standby 0" | cec-client -s')
else:
    print("Not a valid choice.")

