import sys, urllib2

url = ('http://192.168.1.' + sys.argv[2]  + '/pattern' )

if sys.argv[1]=="status":
	status = urllib2.urlopen('http://192.168.1.32/pattern').read()
	if status[10]!=',':
		status = status[9]+status[10]
	else:
		status = status[9]
	if status == sys.argv[3]:
		print("1")
	else:
		print("0")
	
else:
	print ("wrong choice")