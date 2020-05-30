import sys

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

def Fibonacci(n):
	if(n<2):
		return n
	return(Fibonacci(n-1)+Fibonacci(n-2))

x=int(sys.argv[2])
Fibonacci(x)
# Factorial

def Factorial(n):
	if(n==1):
		return(1)
	return(n*Factorial(n-1))
y=int(sys.argv[3])
print(Factorial(y))

