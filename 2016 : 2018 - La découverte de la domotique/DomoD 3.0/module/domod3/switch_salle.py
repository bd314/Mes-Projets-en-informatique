# -*- coding: utf-8 -*-
import sys, os


#Lumières
if sys.argv[1]=="lumieres" :
	if sys.argv[2]=="on":
		print("Turn on switch433 1. ( Meuble )")
		os.system("curl http://192.168.1.18/switchcontrol.php?switch=c")
		os.system("echo 1 > /domod/module/domod3/eta_lswitch1")
	elif sys.argv[2]=="off":
		print("Turn off switch433 1. ( Meuble )")
		os.system("curl http://192.168.1.18/switchcontrol.php?switch=d")
		os.system("echo 0 > /domod/module/domod3/eta_lswitch1")
	elif sys.argv[2]=="status":
		eta = open("/domod/module/domod3/eta_lswitch1","r") 
		print (eta.read())
	else:
		print("Not a valid choice for 'lumière'.")
	
#Lampadaire	
	
if sys.argv[1]=="lampadaire":
	if sys.argv[2]=="on":
		print("Turn on switch433 1. ( Meuble )")
		os.system("curl http://192.168.1.18/switchcontrol.php?switch=g")
		os.system("echo 1 > /domod/module/domod3/eta_lswitch2")
	elif sys.argv[2]=="off":
		print("Turn off switch433 1. ( Meuble )")
		os.system("curl http://192.168.1.18/switchcontrol.php?switch=h")
		os.system("echo 0 > /domod/module/domod3/eta_lswitch2")
	elif sys.argv[2]=="status":
		eta = open("/domod/module/domod3/eta_lswitch2","r") 
		print (eta.read())
	else:
		print("Not a valid choice for 'lampadaire'.")
	
#Entrée
	
if sys.argv[1]=="entree":
	if sys.argv[2]=="on":
		print("Turn on switch433 1. ( Meuble )")
		os.system("curl http://192.168.1.18/switchcontrol.php?switch=e")
		os.system("echo 1 > /domod/module/domod3/eta_lswitch3")
	elif sys.argv[2]=="off":
		print("Turn off switch433 1. ( Meuble )")
		os.system("curl http://192.168.1.18/switchcontrol.php?switch=f")
		os.system("echo 0 > /domod/module/domod3/eta_lswitch3")
	elif sys.argv[2]=="status":
		eta = open("/domod/module/domod3/eta_lswitch3","r") 
		print (eta.read())
	else:
		print("Not a valid choice for 'entree'.")		
	
#Else.. 
	
else:
    print("Not a valid choice.")