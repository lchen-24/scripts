# Use the file name mbox-short.txt as the file name
fname = raw_input("Enter file name: ")
fh = open(fname)
count = 0
total = 0
for line in fh:
    if not line.startswith("X-DSPAM-Confidence:") : continue
    count = count+1
    line_sub = float(line[21:].rstrip())
    total = total + line_sub
average = total/count
print "Average spam confidence: " + str(average)
