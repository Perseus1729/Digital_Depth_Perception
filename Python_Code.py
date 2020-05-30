import sys
import time
# Tower_of _Hanoi
def Tower_of_Hanoi(n,start,end,middle):
	if(n==1):
		print("Move disc from ",start," Rod to",end," Rod")
		return
	Tower_of_Hanoi(n-1,start,middle,end)
	print("Move disc from ",start," Rod to",end," Rod")
	Tower_of_Hanoi(n-1,middle,end,start)

# Fibonacci

def Fibonacci(n):
	if(n<2):
		return n
	return(Fibonacci(n-1)+Fibonacci(n-2))

# Factorial

def Factorial(n):
	if(n==1):
		return(1)
	return(n*Factorial(n-1))

n=int(sys.argv[1])
x=int(sys.argv[2])
y=int(sys.argv[3])

start_time=time.time()
Tower_of_Hanoi(n,'A','C','B')
time_taken=time.time()-start_time
print("Time_Taken:",time_taken)

print(Fibonacci(x))

start_time=time.time()
print(Factorial(y))
time_taken=time.time()-start_time
print("Time_Taken:",time_taken)

