name = raw_input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)

l = list()
d = dict()

for line in handle:
	line=line.rstrip()
	words=line.split()
	if words == [] : continue
	if words[0] != 'From' :continue
        time=words[5]
        hr_min = time.split(":")
        l.append(hr_min[0])

for hours in l:
    d[hours]=d.get(hours,0)+1
    
lst=list()

for hours, count in d.items():
    lst.append((hours, count))

lst.sort()

for hours, count in lst:
    print hours, count
