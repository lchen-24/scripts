#this code asks for integers and records largest and smallest number
largest = None
smallest = None
while True:
    num = raw_input("Enter a number: ")
    if num == "done" : break
    try:
        num=int(num)
        if largest is None and smallest is None:
            largest=num
            smallest=num
        if num>largest:
            largest=num
        else :
            largest=largest
        if num<smallest:
            smallest=num
        else :
            smallest=smallest
    except ValueError:
    	print "Invalid input"
    

print "Maximum is", largest
print "Minimum is", smallest
