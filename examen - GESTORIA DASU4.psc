Proceso DASU
	// Definimos variables globales
	Definir Tecla,eleccion,Datos Como Caracter;
	Definir Posicion Como Entero;
	
	// Dimensionamos los arrays
	Dimension Posicion[200];
	Dimension Datos[200];
	
	// hacer menu
	Repetir
		Borrar Pantalla;
		Escribir 'GESTORIA DASU';
		
		Escribir '1.  Visualización de Documentos';
		Escribir '2.  Búsqueda de Documentos';
		Escribir '3.  Edición de Documentos';
		Escribir '4.  Crear Documento';
		Escribir '5.  Borrar Documentos';
		Escribir '6.  Impresión de Documentos';
		Escribir '7.  Ordenación de Documentos';
	
		Escribir "";
		Escribir 'S.  Finalizar';
	
		Escribir '';
		Escribir 'Introduce una opción: ',Sin Saltar;
		Leer eleccion;
		
		Segun eleccion Hacer
			"1":
				inicializar(Posicion,Datos);
				visualizar(Posicion,Datos);
			"2":
				inicializar(Posicion,Datos);
				Busqueda(Posicion,Datos);
			"3":
				inicializar(Posicion,Datos);
				Edicion(Posicion,Datos);
			"4":
				inicializar(Posicion,Datos);
				Crear(Posicion,Datos);
			"5":
				inicializar(Posicion,Datos);
				Eliminar(Posicion,Datos);
			"6":
				inicializar(Posicion,Datos);
				Impresion();
			"7":
				ordenacion;

			"S" o "s":
				Salir();
			De Otro Modo:
				Escribir 'Ha pulsado una opción incorrecta';
				Escribir 'Pulse una tecla para intentarlo de nuevo';
				Leer Tecla
		Fin Segun
		
	Hasta Que eleccion="S" o eleccion="s";
//	Escribir "";
//	Escribir 'Pulsa una tecla';
//	leer Tecla;
FinProceso
//************************************************
SubProceso Visualizar(Posicion Por Referencia,Datos Por Referencia)
	// definimos variables
	Definir Op Como Entero;
	Definir Tecla Como Caracter;

	Borrar Pantalla;
	Escribir 'GESTORIA DASU - Visualizar un documento';
	Escribir "";
	Escribir "Introduce el número de trabajo a visualizar (1-200)", Sin Saltar;
	Leer Op;
	
	si Op<0 o Op>200 Entonces
		Escribir 'Ha pulsado una opción incorrecta';
		Escribir 'Pulse una tecla para intentarlo de nuevo';
		Leer Tecla
	SiNo
		Pinto(Posicion,Datos,Op);
	FinSi

FinSubProceso
//**********************************	
SubProceso Pinto(Posicion Por Referencia,Datos Por Referencia,Op Por Valor)
	// defino variables locales
	Definir Tecla Como Caracter;
	Definir IndD Como Entero;	// Indice que leo en Posición para acceder a Datos
	Definir i Como Entero;

	// Hay que buscar el numero introducido en el array Posicion, y cuando lo encuentres
	// acceder al array Datos con el contenido de Posicion
	
	IndD<-1;	// Indice que leo en Posicion para acceder a Datos
	
	Mientras Posicion[IndD]<>Op y IndD<200 Hacer	//Mientras no encuentre el nº de operacion
		IndD<-IndD+1;								// vamos sumando el índice
	FinMientras

	si Posicion[IndD]=Op Entonces			// Si coincide el nº de operacion del teclado con el indice de Posicion
		Escribir 'El contenido del documento nº ',Op,' es:';
		si Datos[IndD]="" Entonces	// El elemento de Datos está vacio
			Escribir "$";			// Mostramos el signo $
		SiNo
			Escribir Datos[IndD];	// Mostramos los datos encontrados
			Escribir "";
			Escribir 'Pulsa una tecla para continuar';
			leer Tecla;		// Hacemos una pausa para visualizar los datos
		FinSi
	SiNo	//He llegado al final del vector y no he encontrado Op
		Escribir 'Elemento no encontrado con el número: ',Op;
		Escribir 'Pulsa una tecla para continuar';
		leer Tecla
	FinSi

FinSubProceso
//***************************************
SubProceso Busqueda(Posicion Por Referencia,Datos Por Referencia)
	Definir tecla,Todas Como Entero;
	definir a Como Caracter;	// variable para pulsar una tecla
	Dimension Todas[200];

	Borrar Pantalla;
	Escribir 'GESTORIA DASU - Búsqueda de Documentos';
	
	Escribir '1.  Por Palabra(primera ocurrencia';
	Escribir '2.  Por Palabras (todas las que haya en todos los documentos';
	Escribir ""
	Leer tecla;
	
	Repetir
		si tecla=1 Entonces		//Elegido opcion 1
			Posi<-Palabra1(Datos);
			Escribir ' está en la posicion ',Posi;
		SiNo
			si tecla=2 Entonces	// Elegido opcion 2
				PalabraTodas(Datos,Todas,p,IndTodas);	// Procedimiento para encontrar la palabra
					si IndTodas<>0 Entonces
					Escribir 'La palabra ',p,' está en las posiciones: ';
					para i<-1 Hasta IndTodas Hacer
						Escribir Todas[i];
					FinPara
				SiNo
					Escribir 'La palabra ',p,' no se ha encontrado en ninguna posición';
				FinSi
			SiNo
				Escribir "Ha pulsado una tecla incorrecta";
			FinSi
			
		FinSi
		Escribir 'Pulse una tecla';
		Leer a;		// Hacemos una pausa para visualizar los datos
	Hasta Que Tecla<3 o Tecla>0;

FinSubProceso
//*********************
Funcion  Posi<-Palabra1(Datos Por Referencia)
	// Esta función devuelve la posición en la que se encuentra la palabra introducida
	Definir p Como Caracter;
	Definir i,j,LP Como Entero;
	Definir encontrado Como Logico;
	
	Escribir "Introduce la palabra a encontrar",Sin Saltar;
	Leer p;
	LP<-Longitud(p);

	i<-1;
	encontrado<-Falso;
	Repetir
		si Longitud(Datos[i])<>0 Entonces	// Si no está vacío el elemento del array
			dato<-Datos[i];
			j<-1;
			Mientras encontrado=Falso y j<=Longitud(datos[i])
				Si p=Subcadena(dato,j,j+LP-1) Entonces
					Escribir 'La palabra ',p,Sin Saltar;
					posi<-i;
					encontrado<-Verdadero;
				FinSi
				j<-j+1;
			FinMientras
			i<-i+1;
		SiNo
			i<-i+1;
		FinSi
	Hasta Que i>200 o encontrado=Verdadero;
	
FinFuncion
//*************
SubProceso PalabraTodas(Datos Por Referencia,aux Por Referencia,p Por Valor,IndAux Por Referencia)
	// Procedimiento que devuelve todas las posiciones en las que se encuentra la palabra introducida
	
	Definir i,j,LP,posi Como Entero;
	Definir dato Como Caracter;
	Definir encontrado Como Logico;
	
	IndAux<-0;		//Indice del vector aux, donde voy a meter las posiciones coincidentes

	Escribir "Introduce la palabra a encontrar",Sin Saltar;
	Leer p;
	LP<-Longitud(p);
	
	Para i<-1 Hasta 200 Hacer // Recorro todo el vector para comprobar coincidencias - hay que cambiarlo a 200 cuando terminemos
		si Longitud(Datos[i])<>0 Entonces	// Si no está vacío el elemento del array
			dato<-Datos[i];
			encontrado<-Falso;
			// Escribir "Dato=",dato,"-",Datos[i],'--',i,'longi=',Longitud(datos[i]);
			j<-1;
			Mientras encontrado=Falso y j<=Longitud(datos[i])
				Si p=Subcadena(dato,j,j+LP-1) Entonces	// He encontrado coincidencia
					IndAux<-IndAux+1;
					aux[IndAux)<-i;
					encontrado<-Verdadero;
					Escribir 'Indice=',IndAux,' aux=',aux[IndAux];
				FinSi
				j<-j+1;
			FinMientras
		FinSi
	FinPara
FinSubProceso
//*****************************************
SubProceso Edicion(Posicion Por Referencia,Datos Por Referencia)
	// Añade un texto al final del nº de documento que se ha introducido por teclado
	
	definir NDoc Como Entero;
	Definir texto,textoTotal, tecla Como Caracter;
	
	Escribir "Introduce el nº de documento a editar (1-200): ",Sin Saltar;
	Leer NDoc;
	si NDoc<1 o NDoc>200 Entonces
		Escribir 'Ha metido un nº incorrecto';
	SiNo
		indP<-Posicion[NDoc];
		Escribir "El documento contiene:";
		Escribir Datos[indP];
		Escribir "";
		Escribir "Introduce los datos que quiere añadir";
		Leer texto;
		textoTotal<-Concatenar(Datos[IndP],texto);	//Añade el texto introducido al final del documento
		Datos[IndP]<-textoTotal;
		Escribir "";
		Escribir "Ahora el documento ",NDoc," contiene:";
		Escribir Datos[IndP];
		Escribir "";
		Escribir 'Pulsa para continuar';
		Leer tecla;		// Hacemos una pausa para visualizar los datos
	FinSi

FinSubProceso
//**********************************
SubProceso Crear(Posicion Por Referencia,Datos Por Referencia)
	//Vamos a añadir un documento nuevo que se posicione al final
	
	Definir texto,a Como Caracter; // Texto a añadir
	Definir i Como Entero;
	
	Inicializar(Posicion,Datos);
	Escribir "Introduce el texto a añadir";
	Leer texto;
	i<-1;
	
	Repetir
		i<-i+1;
	Hasta Que i>200 o Datos[i]="";
	// si quisieramos ocupar huecos anteriores, preguntaríamos por Datos[i]='$'
	
	Si i>=200 Entonces
		Escribir 'El vector está lleno';
	SiNo
		Datos[i]=texto;
		posicion[i]=i;
		Escribir 'EL TEXTO ',Datos[i],' se ha insertado en la posición ',i;
		Escribir "";
		Escribir 'Pulse una tecla para continuar';
		Leer a;		// Hacemos una pausa para visualizar los datos
	FinSi
	
FinSubProceso
//**********************************
SubProceso Eliminar(Posicion Por Referencia,Datos Por Referencia)
	// Borra un documento
	
	Definir i,j,NDoc Como Entero;
	Definir encontrado Como Logico;
	Definir a, aux Como Caracter;
	
	Inicializar(Posicion,Datos);
	
	Borrar Pantalla;
	Escribir 'Introduce el nº de documento a borrar: ',Sin Saltar;
	Leer NDoc;	// NDoc es el nº de documento a borrar
	
	encontrado<-Falso; // No he encontrado el elemento
	i<-1;
	
	Repetir
		si Posicion[i]=NDoc Entonces
			encontrado<-Verdadero;	//He encontrado el elemento a borrar
			aux<-Datos[i];
			Datos[i]<-'$';
			Escribir 'Los datos ',aux,' que estaban en la posición ',i;
			Escribir 'han sido eliminados';
			Escribir 'Ahora en la posición ',i,' hay ',Datos[i];
			Escribir '';
			Escribir 'Pulsa una tecla';		// Hacemos una pausa para visualizar los datos
			Leer a;
			Escribir "Comprobamos los datos de los vectores completos:";
			para j<-1 hasta 200 Hacer
				Escribir Posicion[j],'-->',Datos[j],' | ',Sin Saltar;
			FinPara
		SiNo
			i<-i+1;
		FinSi
	Hasta Que i>=200 o encontrado=Verdadero;
	
	si encontrado=Falso Entonces	// No se ha encontrado el documento
		Escribir 'No se ha encontrado el documento ',NDoc;
		Escribir 'Por tanto, no se ha podido borrar';
	FinSi
	
	Escribir '';
	Escribir 'Pulsa una tecla';		// Hacemos una pausa para visualizar los datos
	Leer a;

FinSubProceso

//**********************************
SubProceso Inicializar(v1 Por Referencia,v2 Por Referencia)
	// Inicializamos el vector Datos a capón, teniendo en cuenta
	// que el signo $ lo consideramos vacío.
	
	// Inicializo el vector de posiciones
	para i<-1 hasta 200 Hacer
		v1[i]<-0;
	FinPara
	v1[1]<-5;
	v1[2]<-7;
	v1[3]<-6;
	v1[4]<-4;
	v1[5]<-2;
	v1[6]<-3;
	v1[7]<-1;
	v1[8]<-8;
	
	// Inicializo el vector de datos
	v2[1]<-"";
	v2[2]<-"Examen UF2178";
	v2[3]<-"$";
	v2[4]<-"El carnaval es una celebración pagana.";
	v2[5]<-"por favor no molesten";
	v2[6]<-"Manual de JAVA";
	v2[7]<-"Factura de cliente";
	v2[8]<-"Vuelve a casa por Navidad";

	//Si quisiéramos inicializar automáticamente un vector de caracteres
	//con distintos valores en cada uno de sus elementos lo definimos 
	// como sigue:
//	Definir i Como Entero;
//	
//	para i<- 1 hasta num hacer
//		v[i]<-Concatenar("A - ",ConvertirATexto(i));
//	FinPara

FinSubProceso
//*********************************************
SubProceso Salir()
	Escribir "FIN DEL PROGRAMA";	
FinSubProceso

//**********************************
SubProceso Impresion()
	//Definicion de estructura tipo cola
	Definir MAXCOLA Como Entero;
	MAXCOLA <- 10;
	Definir frente Como Entero;
	Definir final Como Entero;
	Definir numele Como Entero;
	Definir cola Como Caracter;
	
	Dimension cola[MAXCOLA];
	//Fin definicion de cola
	
	Definir vacia Como Logico;
	Definir llena Como Logico;
	Definir exito Como Logico;
	Definir elemento Como Caracter;
	Definir entrada Como Entero;
	Definir i, f Como Entero;
	Definir a Como Caracter;
	
	numele <- 0;
	frente <- 0;
	final <- 1;
	
	Inicializarcola(cola, frente, final, numele);
	
	MenuImpresion;
	
	Leer entrada;
	Mientras entrada <> 0 Hacer
		Segun entrada Hacer
			1:
				Escribir "Introduce elemento: "
				Leer elemento;
				Metercola(cola, frente, final, numele, elemento, exito, MAXCOLA)
				Si exito Entonces
					Escribir "El elemento ", elemento, " se ha encolado en la posicion ", numele;
				SiNo
					Escribir "cola LLENA. el elemento ", elemento, " no se ha introducido";
				FinSi
				Escribir "frente = ", frente, "   final = ", final, "   numele = ", numele;
				Escribir "";
				Escribir 'Pulse una tecla";
				Leer a;
			2:
				Sacarcola(cola, frente, final, numele, elemento, exito)
				Si exito Entonces
					Escribir "El elemento sacado es: ", elemento;
				SiNo
					Escribir "cola VACIA. No existe ningun elemento";
				FinSi
				Escribir "frente = ", frente, "   final = ", final, "   numele = ", numele;
				Escribir "";
				Escribir 'Pulse una tecla";
				Leer a;
			3:
				VisualizarCola(frente,numele,cola);
			4:
				BorrarCola(cola,frente,final,numele);
			5:
				VisualizarCola(frente,numele,cola);
				BorrarCola(cola,frente,final,numele);
			De Otro Modo:
				Escribir "Opcion incorrecta";
				Escribir "Vuelva a introducir la opcion";
		Fin Segun
		
		MenuImpresion;
		Leer entrada;
		Escribir "";
		
	Fin Mientras
	
FinSubProceso
//****************************
SubProceso BorrarCola(cola Por Referencia,frente Por Referencia,final Por Referencia,numele Por Referencia)
	
	Inicializarcola(cola, frente, final, numele);
	Escribir "COLA INICIALIZADA";
	Escribir "";
	Escribir 'Pulsa una tecla';
	Leer a;
FinSubProceso
//*************************************************
SubProceso VisualizarCola(frente Por Valor,numele Por Valor,cola Por Referencia)
	Escribir "La cola tiene los siguientes elementos segun entrada y salida"
	f <- frente;
	Escribir "numele = ", numele;
	Para i <- 1 Hasta numele Hacer
		Escribir "i = ", i, "  f = ", f, ' ',Sin Saltar;
		Escribir "El elemento ", i, " es ", Sin Saltar;
		Escribir cola[f];
		f <- f + 1;
	FinPara
	Escribir "";
	Escribir 'Pulse una tecla";
	Leer a;
FinSubProceso
//****************************************
Funcion vacia <- ColaVacia (colav, frentev, finalv, numelev)
	Si numelev = 0 Entonces
		vacia <- Verdadero;
	SiNo
		vacia <- Falso;
	FinSi
Fin Funcion
//********************************************
Funcion llena <- ColaLlena (colal, numelel, maximol)
	Si numelel = maximol Entonces
		llena <- Verdadero;
	SiNo
		llena <- Falso;
	FinSi
Fin Funcion
//*******************************
SubProceso Inicializarcola (colai Por Referencia, frentei Por referencia, finali Por Referencia, numelei Por Referencia)
	frentei <- 1;
	finali <- 1;
	numelei <- 0;
FinSubProceso
//********************************************
SubProceso Metercola (colam Por Referencia, frentem Por referencia, finalm Por referencia, numelem Por referencia, elem Por Valor, exitom Por Referencia, maximom Por Valor)
	Si ColaLlena(colam, numelem, maximom) Entonces 
		exitom <- Falso;
	SiNo
		Si (finalm = maximom + 1) Entonces
			ReorganizarCola(colam, frentem, finalm, numelem, maximom);
		FinSi
		colam[finalm] <- elem;
		finalm = finalm + 1;
		numelem = numelem + 1;
		exitom <- Verdadero;
	FinSi
FinSubProceso
//*******************************************
SubProceso ReorganizarCola (colao Por Referencia, frenteo Por referencia, finalo Por referencia, numeleo Por Valor, maximoo Por Valor) 
	Escribir "frente = ", frenteo, "   final = ", finalo, "   numele = ", numeleo;
	Para i <- 1 Hasta numeleo Con Paso 1 Hacer
		colao[i] <- colao[frenteo];
		frenteo = frenteo + 1;
	FinPara
	frenteo <- 1;
	finalo <- numeleo + 1;
	Escribir "frente = ", frenteo, "   final = ", finalo, "   numele = ", numeleo;
FinSubProceso
//*********************************
SubProceso Sacarcola (colasa Por Referencia, frentesa Por referencia, finalsa Por referencia, numelesa Por referencia, elesa Por Referencia, exitosa Por Referencia)
	Si ColaVacia(colasa, frentesa, finalsa, numelesa) Entonces 
		exitosa <- Falso;
	SiNo
		elesa <- colasa[frentesa]
		numelesa = numelesa - 1;
		Si numelesa = 0 Entonces
			Inicializarcola(colasa, frentesa, finalsa, numelesa);
		SiNo
			frentesa <- frentesa + 1;
		FinSi
		exitosa <- Verdadero;
	FinSi
FinSubProceso
//************************************************
SubProceso Recuperarcola (colar Por Referencia, frenter Por Valor, finalr Por Valor, numeler Por Valor, eler Por Referencia, exitor Por Referencia)
	Si ColaVacia(colasa, frentesa, finalsa, numelesa) Entonces 
		exitor <- Falso;
	SiNo
		eler <- colar[frenter]
		exitor <- Verdadero;
	FinSi
FinSubProceso
//******************************************
Subproceso MenuImpresion
	Borrar Pantalla;
	Escribir "";
	Escribir 'GESTORIA DASU - Impresión de Documentos';
	Escribir "";
	Escribir "Elija una de las siguientes opciones:";
	Escribir "   1 - Añadir un elemento en la cola";
	Escribir "   2 - Borrar elemento de la cola"; 
	Escribir "   3 - Visualizar los elementos de la cola";
	Escribir "   4 - Inicializar la cola (Vaciar)";
	Escribir "   5 - Iniciar impresión (Visualizar y Vaciar)";
	Escribir "   0 - Volver";
FinSubProceso
//****************************************************************
SubProceso ordenacion
	
	Definir i,j,vector1,vector2,vector3,VTotal,Ele1,Ele2,Ele3,EleTotal Como Entero;
	Definir a Como Caracter;
	
	Escribir "Número de elementos del vector 1";
	leer Ele1;
	Dimension vector1[Ele1];
	Escribir "Número de elementos del vector 2";
	leer Ele2;
	Dimension vector2[Ele2];
	Escribir "Número de elementos del vector 3";
	leer Ele3;
	Dimension vector3[Ele3];
	
	Escribir 'Llenando vector 1...";
	LlenarVector(vector1,Ele1);
	Escribir 'Llenando vector 2...";
	LlenarVector(vector2,Ele2);
	Escribir 'Llenando vector 3...";
	LlenarVector(vector3,Ele3);
	
	Escribir 'Se han llenado los 3 vectores. Pulsa una tecla';
	leer a;
	
	Escribir "";
	Escribir "El vector 1 contiene: ";
	ver_vector(vector1,Ele1);
	
	Escribir "";
	Escribir "El vector 2 contiene: ";
	ver_vector(vector2,Ele2);
	Escribir "";
	Escribir "El vector 3 contiene: ";
	ver_vector(vector3,Ele3);
	Escribir "";
	
	Escribir "";
	Escribir "Ordenando vector 1...";
	burbuja_mejorado(vector1,Ele1);	// Ordenamos el vector 1
	ver_vector(vector1,Ele1);
	
	Escribir "";
	Escribir "Ordenando vector 2...";
	burbuja_mejorado(vector2,Ele2);	// Ordenamos el vector 2
	ver_vector(vector2,Ele2);
	
	Escribir "";
	Escribir "Ordenando vector 3...";
	burbuja_mejorado(vector3,Ele3);	// Ordenamos el vector 3
	ver_vector(vector3,Ele3);
	Escribir "";
	
	// Vamos a generar la suma de los 3 vectores
	
	EleTotal<-Ele1+Ele2+Ele3;	//El total de los elementos del vector suma
	Dimension VTotal[EleTotal]	//Dimensionamos el vector suma de los 3 vectores
	Escribir "";
	Escribir 'Voy a sumar los 3 vectores';
	
	SumoVectores(vector1,Ele1,vector2,Ele2,vector3,Ele3,Vtotal,EleTotal)
	
FinSubProceso
//*********************************************
SubProceso LlenarVector(v Por Referencia,tam Por Valor)
	
	inicializarV(v,tam);
	
	ver_vector(v,tam);
	Escribir " "

	Escribir "FINALIZADO, pulsa una letra para continuar"
	leer espera;
FinSubProceso
//***********************************************
SubProceso inicializarV(v Por Referencia,num por valor)
	i Es Entero
	para i<- 1 hasta num hacer
		v[i]<-azar(9);
	FinPara
FinSubProceso
//**********************
SubProceso ver_vector(v Por Referencia,num por valor)
	i Es Entero
	para i<- 1 hasta num hacer
		escribir v[i]," " Sin Saltar;
	FinPara
FinSubProceso
//******************************
subproceso burbuja_mejorado(v por referencia,num por valor)
	i,j Es Entero;
	nointercambio es logico;
	
	i<-1;
	Repetir
		nointercambio=Verdadero
		para j<-1 hasta num-i hacer
			si v[j]>v[j+1] entonces
				intercambiar(v,j,j+1);
				nointercambio <- Falso;
			FinSi
		FinPara
		i=i+1;		
	Hasta Que nointercambio=Verdadero;
	Escribir "Se ha hecho en ",i-1," pasadas"
FinSubProceso
//***************************************
subproceso intercambiar(v Por Referencia,actual,siguiente)
	aux es entero
	
	aux <- v[actual];
	v[actual]<-v[siguiente];
	v[siguiente]<-aux;
	
FinSubProceso
//***************************************
SubProceso SumoVectores(v1 Por Referencia, e1 Por Valor,v2 Por Referencia,e2 Por Valor,v3 Por Referencia,e3 Por Valor,vt Por Referencia,et Por Referencia)
	Definir i Como Entero;
	Definir a Como Caracter;
	
	para i<-1 hasta e1 hacer
		vt[i]<-v1[i];
	FinPara
	Escribir "El contenido de vector Total despues de añadir vector1 es:";
	ver_vector(vt,et);
	
	Escribir "";
	
	para i<-1 hasta e2 Hacer
		vt[e1+i]<-v2[i];
	FinPara
	
	Escribir "El contenido de vector Total despues de añadir vector 2 es:";
	ver_vector(vt,et);
	
	Escribir "";
	
	Para i<-1 Hasta e3 Hacer
		vt[e1+e2+i]<-v3[i];
	FinPara
	Escribir "El contenido de vector Total despues de añadir vector 3 es:";
	ver_vector(vt,et);
	Escribir "";
	
	burbuja_mejorado(vt,et);	// Ordenamos el vector total
	Escribir"";
	Escribir "Vector Total ordenado (vector1 + vector 2 + vector3)";
	ver_vector(vt,et);
	
	Escribir "";
	Escribir 'pulsa una tecla';
	Leer a;
	
FinSubProceso
//***********************************



