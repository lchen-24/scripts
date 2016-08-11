fname = raw_input("Enter file name: ")
if len(fname) < 1 : fname = "regex_sum_268698.txt"

import re

fh = open(fname)
totalsum = 0

for line in fh:
    line=line.rstrip()
    numbers=re.findall('[0-9]+',line)
    numbers=[int(i) for i in numbers]
    small_sum=sum(numbers)
    totalsum=totalsum+small_sum
print totalsum
