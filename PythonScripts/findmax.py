name = raw_input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)

counts = dict()
names = list()

for line in handle:
	line=line.rstrip()
	words=line.split()
	if words == [] : continue
	if words[0] != 'From' :continue
        names.append(words[1])
    
for name in names:
    counts[name]=counts.get(name,0)+1
    
maxval=None
maxkee = None
for kee,val in counts.items() :
    if maxval == None : 
        maxval = val
        maxkee = kee
    if maxval < val : 
        maxval = val
        maxkee = kee
        
print maxkee, maxval
