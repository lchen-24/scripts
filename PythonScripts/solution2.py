# Note - this code must run in Python 2.x and you must download
# http://www.pythonlearn.com/code/BeautifulSoup.py
# Into the same folder as this program

import urllib
from BeautifulSoup import *

url = raw_input('Enter URL: ')
count = raw_input('Enter count: ')
count = int(count)
position = raw_input('Enter position: ')
position = int(position) - 1
print 'Retrieving: ',url
html = urllib.urlopen(url).read()
soup = BeautifulSoup(html)

# Retrieve all of the anchor tags
tags = soup('a')
print 'Retrieving: ',tags[position].get('href',None)

newcount= 1

while newcount<count:
    newurl = tags[position].get('href',None)
    newhtml = urllib.urlopen(newurl).read()
    newsoup = BeautifulSoup(newhtml)

    newtags = newsoup('a')
    print 'Retrieving: ',newtags[position].get('href',None)
    newcount = newcount+1
    tags = newtags