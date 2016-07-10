#read file name
fname = input("Enter file name: ")

#open file
fh = open(fname)

#create empty list
lst = list()

#split into list of words
for line in fh:
    line=line.rstrip()
    words=line.split()
    for i in range(len(words)):
        if words[i] in lst : continue
        if words[i] not in lst : lst.append(words[i])
print(sorted(lst))