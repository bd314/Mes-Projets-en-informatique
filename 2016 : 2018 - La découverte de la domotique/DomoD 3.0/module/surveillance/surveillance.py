# -*- coding: utf-8 -*-
import sys, os
if sys.argv[1]=="on":
	os.system('wget --keep-session-cookies --save-cookies cookies.txt -d -O -  \'http://192.168.1.30:5000/webapi/entry.cgi?api=SYNO.SurveillanceStation.ExternalEvent&method=\"Trigger\"&version=1&eventId=1&eventName=\"This is external event1\"&account=\"Baptiste\"&password=\"Sepzyg-zosneb-qogko9\"\'')
	os.system("echo 1 > /domod/module/domod3/eta_surveillance")
elif sys.argv[1]=="off":
	os.system('wget --keep-session-cookies --save-cookies cookies.txt -d -O -  \'http://192.168.1.30:5000/webapi/entry.cgi?api=SYNO.SurveillanceStation.ExternalEvent&method=\"Trigger\"&version=1&eventId=2&eventName=\"This is external event1\"&account=\"Baptiste\"&password=\"Sepzyg-zosneb-qogko9\"\'')
	os.system("echo 0 > /domod/module/domod3/eta_surveillance")
elif sys.argv[1]=="status":
	eta = open("/domod/module/domod3/eta_surveillance","r") 
	print (eta.read())
else:
	print("Not a valid choice.")