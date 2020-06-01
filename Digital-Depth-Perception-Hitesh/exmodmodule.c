#include <Python.h>
static PyObject *exmodError;
static PyObject *exmod_say_hello(PyObject *self,PyObject *args){
	const char* msg;
	int sts=0;

	if(!PyArg_ParseTuple(args,"s",&msg)){
		return NULL;//return error if none found
	}
	//check to see if there is an error with information passed to this
	if(strcmp(msg,"this_is_an_error")==0){
		//if error raises an exception without an exception object
		PyErr_SetString(exmodError,"This is an test exception error after typing an expected invalid response");
		return NULL;//propagate this error to the caller

	}else{
		//no error Found,continue execution 
		printf("This in C World\nYour Message is:%s\n",msg );
		sts=21; //return 0 for success

	}
	return Py_BuildValue("i",sts);

	return NULL;
}
static PyObject *exmod_add(PyObject *self,PyObject *args){
	double a,b;
	double sts=0;

	//We expect atleast one string argument to this function
	if(!PyArg_ParseTuple(args,"dd",&a,&b)){
		return NULL;//return error if none found
	}	
	sts=a+b;
	printf("This in C World\nAddition of %f + %f = %f \n",a,b,sts );
	return Py_BuildValue("d",sts);

}

static PyMethodDef exmod_methods[] = {
	//PythonName    C-FunctionName   ,  argumentPresentation,     description
	{"say_hello",   exmod_say_hello,     METH_VARARGS, "Say hello from c and Print Message"},
	{"add",         exmod_add,           METH_VARARGS, "Add two numbers in c"},
	{NULL,NULL,0,NULL}  /*sentinel*/

};

PyMODINIT_FUNC PyInit_exmod(void){
	PyObject *m;
	m= Py_InitModule("exmod",exmod_methods);
	if(m==NULL) return m ;
	exmodError=PyErr_NewException("exmod.error",NULL,NULL);//exmod.error python error object
	Py_INCREF(exmodError);
	PyModule_AddObject(m,"error",exmodError);

}








