import urllib
import json

while True:
    address = raw_input('Enter location: ')
    if len(address) < 1 : break

    url = address
    print 'Retrieving', url
    uh = urllib.urlopen(url)
    uh2 = uh.read()
    print 'Retrieved',len(uh2),'characters'
    
    data = json.loads(uh2)
    
    total = 0
    count = 0
    
    for item in data['comments']:
        total = int(item['count'])+ total
        count = count+1
        
    print 'Count: ', count
    print 'Sum: ', total

