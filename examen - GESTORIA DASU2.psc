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
				Eliminar();
			"6":
				inicializar(Posicion,Datos);
				Impresion();

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
	
//	para i<-1 hasta 8 Hacer
//		Escribir "Posicion= ",Posicion[i]," -- ",Datos[i];
//	FinPara

	IndD<-1;
	
	Mientras Posicion[IndD]<>Op y IndD<200 Hacer
		IndD<-IndD+1;
	FinMientras

	si Posicion[IndD]=Op Entonces
		Escribir 'El contenido del documento nº ',Op,' es:';
		si Datos[IndD]="" Entonces	// El elemento de Datos está vacio
			Escribir "$';
		SiNo
			Escribir Datos[IndD];
			Escribir "";
			Escribir 'Pulsa una tecla para continuar';
			leer Tecla;
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
	definir a Como Caracter;
	Dimension Todas[200];

	Borrar Pantalla;
	Escribir 'GESTORIA DASU - Búsqueda de Documentos';
	
	Escribir '1.  Por Palabra(primera ocurrencia';
	Escribir '2.  Por Palabras (todas las que haya en todos los documentos';
	Escribir ""
	Leer tecla;
	
	Repetir
		si tecla=1 Entonces
			Posi<-Palabra1(Datos);
			Escribir ' está en la posicion ',Posi;
		SiNo
			si tecla=2 Entonces
				PalabraTodas(Datos,Todas,p,IndTodas);
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
		Leer a
	Hasta Que Tecla<3 o Tecla>0;

FinSubProceso
//*********************
Funcion  Posi<-Palabra1(Datos Por Referencia)
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
	Hasta Que i>20 o encontrado=Verdadero;	// hay que cambiarlo a 200 cuando terminemos
	
FinFuncion

//*************
SubProceso PalabraTodas(Datos Por Referencia,aux Por Referencia,p Por Valor,IndAux Por Referencia)
	Definir i,j,LP,posi Como Entero;
	Definir dato Como Caracter;
	Definir encontrado Como Logico;
	
	IndAux<-0;		//Indice del vector aux, donde voy a meter las posiciones coincidentes

	Escribir "Introduce la palabra a encontrar",Sin Saltar;
	Leer p;
	LP<-Longitud(p);
	
	Para i<-1 Hasta 20 Hacer // Recorro todo el vector para comprobar coincidencias - hay que cambiarlo a 200 cuando terminemos
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
		Leer tecla;
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
		Escribir 'i=',i,'--',Datos[i],'--',Sin Saltar;
		i<-i+1;
		Escribir 'pulsa';
		leer a;
	Hasta Que i>200 o Datos[i]="";	// Datos es un array numérico. No puede contener el signo $
	
	Si i>200 Entonces
		Escribir 'El vector está lleno';
	SiNo
		Datos[i]=texto;
		posicion[i]=i;	// no se si es correcto
		
	FinSi
	
FinSubProceso
//**********************************
SubProceso Eliminar()
	
FinSubProceso
//**********************************
SubProceso Impresion()
	
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
	v1[4]<-6;
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
//**********************************
//SubProceso IniNum(v Por Referencia,num Por Valor)
//	Definir i Como Entero;
//	para i<- 1 hasta num hacer
//		v[i]<-azar(9);
//	FinPara
//	
//FinSubProceso
//**********************************
SubProceso Salir()
	Escribir "FIN DEL PROGRAMA";	
FinSubProceso




