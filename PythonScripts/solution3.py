import urllib
import xml.etree.ElementTree as ET

address = raw_input('Enter location: ')

url = address
print 'Retrieving', url
uh = urllib.urlopen(url)
data = uh.read()
print 'Retrieved',len(data),'characters'
tree = ET.fromstring(data)

counts = tree.findall("comments/comment")
print 'Count: ',len(counts)

sums = 0
for item in counts:
    sums = sums+ int(item.find('count').text)
print 'Sum: ',sums