#include <Python.h>
#include <iostream>
int Cfib(int n){
	if(n<2){
		return n;
	}
	return Cfib(n-1)+Cfib(n-2);
}
int Cfac(int n){
	if(n==1){
		return 1;
	}
	return n*Cfac(n-1);
}
void CTOH(int n, char start,char middle, char end){
	if (n == 1)  
    {  
        cout << "Move disk 1 from rod " << start <<" to rod " << middle<<endl;  
                              
        return;  
    }  
    CTOH(n - 1, start, end, middle);  
    cout << "Move disk " << n << " from rod " << start <<" to rod " << middle <<endl;  
                                 
    CTOH(n - 1, end, middle, start);  
}
static PyObject *fib(PyObject *self,PyObject *args){
	int n;
	if(!PyArg_ParseTuple(args,"i",&n)){
		return NULL;

	}
	return PyBuildValue("i",Cfib(n));
}
static PyObject *fac(PyObject *self,PyObject *args){
	int n;
	if(!PyArg_ParseTuple(args,"i",&n)){
		return NULL;

	}
	return PyBuildValue("i",Cfib(n));	
}
static PyObject *TOH(PyObject *self,PyObject *args){
	int n;
	if(!PyArg_ParseTuple(args,"i",&n)){
		return NULL;

	}
	return PyBuildValue("i",10);;	
}
static PyMethodDef myMethods[] ={
	{"fib",fib,METH_VARARGS,"Calculates the fibonacci numbers "},
	{"fac",fac,METH_VARARGS,"Finds the factorial"},
	{"TOH",TOH,METH_VARARGS,"Finds the correct sequence of steps in tower of hanoi"},
	{NULL,NULL,0,NULL}
};

static struct PyModuleDef myModule ={
	PyModuleDef_HEAD_INIT,
	"myModule",
	"Recursive Module",
	-1,
	myMethods
};
PyMODINIT_FUNC PyInit_myModule(void){
	return PyModule_Create(&myModule);
}
















