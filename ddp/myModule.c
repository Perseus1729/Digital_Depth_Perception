#include <Python.h>
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
	if (n == 1){
		printf("\n Move disk 1 from rod %c to rod %c", start, end);                             
        return;  
    }  
    CTOH(n - 1, start, end, middle); 
    printf("\n Move disk %d from rod %c to rod %c", n, start, end);                            
    CTOH(n - 1, end, middle, start);  
}
static PyObject *fib(PyObject *self,PyObject *args){
	int n;
	if(!PyArg_ParseTuple(args,"i",&n)){
		return NULL;

	}
	return Py_BuildValue("i",Cfib(n));
}
static PyObject *fac(PyObject *self,PyObject *args){
	int n;
	if(!PyArg_ParseTuple(args,"i",&n)){
		return NULL;

	}
	return Py_BuildValue("i",Cfac(n));	
}
static PyObject *TOH(PyObject *self,PyObject *args){
	int n;
	if(!PyArg_ParseTuple(args,"i",&n)){
		return NULL;

	}
	CTOH(n,'A','C','B');
	return Py_BuildValue("i",10);;	
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