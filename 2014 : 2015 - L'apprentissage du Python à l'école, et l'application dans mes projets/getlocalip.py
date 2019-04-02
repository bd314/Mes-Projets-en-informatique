import tweepy, time, sys, socket, datetime
from time import gmtime, strftime

#enter the corresponding information from your Twitter application:
CONSUMER_KEY = 'PRIVATE'#keep the quotes, replace this with your consumer key
CONSUMER_SECRET = 'PRIVATE'#keep the quotes, replace this with your consumer secret key
ACCESS_KEY = 'PRIVATE-PRIVATE'#keep the quotes, replace this with your access token
ACCESS_SECRET = 'PRIVATE'#keep the quotes, replace this with your access token secret
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_KEY, ACCESS_SECRET)
api = tweepy.API(auth)
user = api.me()

user_receiver_id=PRIVATE #Get with http://gettwitterid.com/


print([(s.connect(('8.8.8.8', 80)), s.getsockname()[0], s.close()) for s in [socket.socket(socket.AF_INET, socket.SOCK_DGRAM)]][0][1])

print('Name: ' + user.name)
api.send_direct_message(user_receiver_id, text ='Le raspberryPi a boot. Son ip local est :' + [(s.connect(('8.8.8.8', 80)), s.getsockname()[0], s.close()) for s in [socket.socket(socket.AF_INET, socket.SOCK_DGRAM)]][0][1])



print("DM LocalIp sent.")

