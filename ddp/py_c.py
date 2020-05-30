import myModule
import time
import sys

n=int(sys.argv[1])
x=int(sys.argv[2])
y=int(sys.argv[3])

print(myModule.fib(x))

start_time=time.time()
myModule.TOH(n)
time_taken=time.time()-start_time
print("Time_Taken:",time_taken)

start_time=time.time()
print(myModule.fac(y))
time_taken=time.time()-start_time
print("Time_Taken:",time_taken)
