import sys
'''
# Tower_of _Hanoi
def Tower_of_Hanoi(n,start,end,middle):
	if(n==1):
		print("Move disc from ",start," Rod to",end," Rod")
		return
	Tower_of_Hanoi(n-1,start,middle,end)
	print("Move disc from ",start," Rod to",end," Rod")
	Tower_of_Hanoi(n-1,middle,end,start)
n=int(sys.argv[1])
Tower_of_Hanoi(n,'A','C','B')

# Fibonacci

def Fibonacci(terms):
	a,b=1,1;
	count=1
	while(count<=terms):
		print(a)
		a,b=b,a+b
		count+=1

x=int(sys.argv[2])
Fibonacci(x)
# Factorial

def Factorial(n):
	if(n==1):
		return(1)
	return(n*Factorial(n-1))
y=int(sys.argv[3])
print(Factorial(y))
'''
