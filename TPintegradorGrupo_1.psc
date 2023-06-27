Algoritmo sin_titulo
	Definir rutasAereas, dni, pasajeros, telefono, pasajerosDos como cadena
	Definir cantidadPasajeros, pasajeroFrecuente, pasajesVendido, asiento, opcionMenu,dniLong, telLong Como Entero
	Definir opcionSwitch, salir Como Caracter
	Definir equipajePasajero Como Logico
	Dimension rutasAereas[4], capacidadPasajeros[4], pasajesVendido[4], dni[4,120], asiento[4,120], pasajeros[4,120],telefono[4,120]
	Dimension pasajeroFrecuente[4,120], equipajePasajero[4,120]
	
	rutasAereas[0] <- "Buenos Aires - Bariloche"
	rutasAereas[1] <- "Buenos Aires - Salta"
	rutasAereas[2] <- "Rosario - Buenos Aires"
	rutasAereas[3] <- "Mar Del Plata - Mendoza"
	
	capacidadPasajeros[0] <- 120
	capacidadPasajeros[1] <- 120 
	capacidadPasajeros[2] <- 80
	capacidadPasajeros[3] <- 80
	
	pasajesVendido[0] <- 0
	pasajesVendido[1] <- 0
	pasajesVendido[2] <- 0
	pasajesVendido[3] <- 0
	
	
	Repetir
		mostrarMenu()
		Leer opcionMenu
		
		segun opcionMenu Hacer
			1:
				ventaPasajes(rutasAereas,pasajesVendido,capacidadPasajeros,dni,pasajeros,telefono,asiento,pasajeroFrecuente,equipajePasajero)
			2: 
				buscarPasajeVendido(pasajesVendido,asiento, pasajeros, dni, rutasAereas)
			3:
				buscarPasajero(pasajesVendido, pasajeros, dni, rutasAereas)
			4: 
				ordenarListaPasajeros(rutasAereas,pasajesVendido,dni,pasajeros,telefono,asiento,pasajeroFrecuente,equipajePasajero)
			5: 
				Escribir "Seleccione una opción"
				Escribir "a- Cantidad de pasajes vendidos por ruta aérea"
				Escribir "b- Porcentaje de ventas por ruta aérea"
				Leer opcionSwitch
				
				Mientras opcionSwitch <> "a" y opcionSwitch <> "A" y opcionSwitch <> "b" y opcionSwitch <> "B" Hacer
					Escribir "Opción inválida. Intente nuevamente"
					Leer opcionSwitch
				FinMientras
				
				Si opcionSwitch = "a" o opcionSwitch = "A"
					cantidadPasajesVendidosPorRuta(rutasAereas,pasajesVendido)
				SiNo
					porcentajeVentasPorRuta(rutasAereas,capacidadPasajeros, pasajesVendido)
				FinSi
			6: //VALIDAMOS QUE SI EL USUARIO NO ESCRIBE SALIR EL PROGRAMA SIGUE EN EJECUCION
				Escribir "Estas seguro que desea salir?"
				Escribir "Escriba SALIR para confirmar"
				Leer salir
				salir <- Mayusculas(salir)
				Si salir = "SALIR" Entonces
					Escribir "Hasta luego"
				Fin Si
			De Otro Modo:
				Escribir "Opción inválida. Intente nuevamente"
		FinSegun
	Hasta Que salir = "SALIR"
FinAlgoritmo

//MENU PRINCIPAL
SubProceso mostrarMenu()
	Escribir "Bienvenido al sistema de venta de pasajes"
	Escribir "1- Venta de pasajes"
	Escribir "2- Buscar pasaje vendido"
	Escribir "3- Buscar pasajero"
	Escribir "4- Ordenar y mostrar lista pasajeros"
	Escribir "5- Listado/s"
	Escribir "6- Salir"
FinSubProceso

//COMPLETAMOS LOS ARRAYS DE VENTAS CON LOS DATOS CORRESPONDIENTES
// FILAS->RUTAS; COLUMNAS->DATOS DEL PASAJERO, X ASIENTO
Funcion ventaPasajes(rutasAereas,pasajesVendido,capacidadPasajeros,dni,pasajeros,telefono,asiento,pasajeroFrecuente,equipajePasajero)
	Definir nombreApellido, dniPasajero, telefonoPasajero como cadena
	Definir asientoPasajero, numPasajeroFrecuente, ruta, i Como Entero
	Definir equipaje Como cadena
	Definir equipajeBodega Como Logico
	Definir costoPasaje Como Real
	
	Escribir "Venta de pasajes"
	Escribir "Rutas Aéreas disponible"
	Para i = 0 Hasta 3 Hacer
		Escribir i+1, " ", rutasAereas[i]
	FinPara
	
	Escribir "Seleccione una ruta"
	Leer ruta
	
	Mientras ruta < 1 o ruta > 4 Hacer
		Escribir "Ruta inválida. Intente nuevamente"
		Leer ruta
	FinMientras
	
	ruta <- ruta - 1 //RESTAMOS UNO PARA QUE SEA CORRESPONDIENTE AL INDICE YA QUE EL 1 SERIA EL 0 (0...3)
	
	Si pasajesVendido[ruta] = capacidadPasajeros[ruta] Entonces
		Escribir "No hay pasajes disponibles"
	SiNo
		Escribir "Ingrese el nombre y apellido del pasajero"
		Leer nombreApellido
		
		Repetir
			Escribir "Ingrese el DNI del pasajero"
			Leer dniPasajero
			dniLong<-Longitud(dniPasajero)
			Si dniLong<6 o dniLong>8 Entonces
				Escribir "DNI Incorrecto"
			Fin Si
		mientras Que dniLong<6 o dniLong>8
		
		Repetir
			Escribir  "Ingrese el télefono del pasajero"
			Leer telefonoPasajero
			telLong<-Longitud(telefonoPasajero)
			Si telLong<8 Entonces
				Escribir "Telefono Incorrecto"
			Fin Si
		mientras Que telLong<8
		
		Repetir
			Escribir "¿Tiene equipaje en la bodega? (S/N)"
			Leer equipaje
			Si (equipaje <> "S" y equipaje <> "s") y (equipaje <> "N" y equipaje <> "n") Entonces
				Escribir "Respuesta incorrecta"
			Fin Si
		Mientras Que (equipaje <> "S" y equipaje <> "s") y (equipaje <> "N" y equipaje <> "n")
		
		
		
		Si equipaje = "S" o equipaje = "s"
			equipajeBodega <- Verdadero
		Sino 
			Si equipaje = "N" o equipaje = "n"
				equipajeBodega <- Falso
			FinSi
		FinSi
		
		Repetir
			Escribir "Número de pasajero frecuente"
			Leer numPasajeroFrecuente
			
			Si numPasajeroFrecuente<=0 Entonces
				Escribir "Nùmero de pasajero Incorrecto"
			Fin Si
		mientras Que numPasajeroFrecuente<=0
		
		//UTILIZAMOS ESTO PASA CONTAR LOS PASAJES VENDIDOS Y LLEVAR UN REGISTRO DE LOS ASIENTOS
		asientoPasajero <- pasajesVendido[ruta] 
		pasajesVendido[ruta] <- pasajesVendido[ruta] + 1
		
		//CALCULAMOS EL COSTO DE LOS PASAJES APLICANDO LOS INCREMENTOS SEGUN LA CANTIDAD DE PASAJES VENDIDOS
		costoPasaje <- CalcularCostoPasaje(ruta,cantidadPasajeros,equipajeBodega)
		
		//ALMACENAMIENTO DE DATOS
		equipajePasajero[ruta,asientoPasajero]<- equipajeBodega
		pasajeros[ruta,asientoPasajero] <- nombreApellido
		dni[ruta,asientoPasajero] <- dniPasajero
		telefono[ruta,asientoPasajero] <- telefonoPasajero
		pasajeroFrecuente[ruta,asientoPasajero] <- numPasajeroFrecuente
		asiento[ruta, asientoPasajero] <- pasajesVendido[ruta]
		
		
		Escribir "Resumen de la venta"
		Escribir "Ruta: ", rutasAereas[ruta]
		Escribir "Nombre y Apellido: ", nombreApellido
		Escribir "DNI: ", dniPasajero
		Escribir "Télefono: ", telefonoPasajero
		Escribir "Equipaje en Bodega: ", equipajeBodega
		Escribir "Número de pasajero frecuente: ", numPasajeroFrecuente
		Escribir "Asiento: ", asientoPasajero
		Escribir "Costo pasaje: $", costoPasaje
		
		//SIMULA UN SYSTEM("PAUSE"); EN C
		Escribir "Presione una tecla para continuar..."
		leer var
		Limpiar Pantalla
	FinSi
	
	
	
FinFuncion

Funcion costoPasaje <- CalcularCostoPasaje(ruta,cantidadPasajeros,equipajeBodega)
	Definir costoInical Como Real
	
	Segun ruta Hacer
		0:
			costoInical <- 150000
			Si cantidadPasajeros > 20 y cantidadPasajeros < 60 Entonces
				
				costoInical <- costoInical * 1.1
			FinSi
			Si cantidadPasajeros > 60 Entonces
				
				costoInical <- 180000
			FinSi
		1:
			costoInical <- 120000
			Si cantidadPasajeros > 20 y cantidadPasajeros < 60 Entonces
				costoInical <- costoInical *1.1
			FinSi
			Si cantidadPasajeros > 60 Entonces
				costoInical <- 150000
			FinSi
		2:
			costoInical <- 70000
			Si cantidadPasajeros > 10 y cantidadPasajeros < 40 Entonces
				costoInical <- costoInical *1.15
			FinSi
			Si cantidadPasajeros > 40 Entonces
				costoInical <- 95000
			FinSi
		3:	
			costoInical <- 95000
			Si cantidadPasajeros > 10 y cantidadPasajeros < 40 Entonces
				costoInical <- costoInical * 1.15
			FinSi
			Si cantidadPasajeros > 40 Entonces
				costoInical <- 125000
			FinSi
	FinSegun
	
	Si equipajeBodega = Verdadero Entonces
		costoInical <- costoInical * 1.05
	FinSi
	costoPasaje<-costoInical
FinFuncion

SubProceso buscarPasajeVendido(pasajesVendido,asiento, pasajeros, dni, rutasAereas)
	Definir asientoBuscado, i, j, rutaBuscada Como Entero
	Definir bandera Como Logico
	bandera <- Falso
	Escribir "Ingrese la ruta"
	Para i = 0 Hasta 3 Hacer
		Escribir i+1, " ", rutasAereas[i]
	FinPara
	
	Leer rutaBuscada
	rutaBuscada<-rutaBuscada-1 //SE REPITE EL MISMO CASO QUE EN RUTA (EXPLICADO ANTERIORMENTE) (LINEA 102)
	Escribir "Ingrese el número de asiento"
	Leer asientoBuscado
	Para i<-0 Hasta pasajesVendido[rutaBuscada] Con Paso 1 Hacer
		Si asiento[rutaBuscada,i]=asientoBuscado Entonces
			Escribir "Nombre y Apellido: ", pasajeros[rutaBuscada, i]
			Escribir "Destino: ", rutasAereas[rutaBuscada]
			Escribir "DNI: ", dni[rutaBuscada, i]
			bandera <- Verdadero
		Fin Si
	Fin Para
	
	Si no bandera Entonces
		Escribir "Asiento no vendido"
	Fin Si
	
	Escribir "Presione una tecla para continuar..."
	leer var
	Limpiar Pantalla
FinSubProceso

SubProceso buscarPasajero(pasajesVendido, pasajeros, dni, rutasAereas)
	Definir  i, j, rutaBuscada Como Entero
	Definir nombreBuscado Como Caracter
	Definir  bandera Como Logico
	bandera <- Falso
	Escribir "Ingrese la ruta"
	Para i = 0 Hasta 3 Hacer
		Escribir i+1, " ", rutasAereas[i]
	FinPara
	Leer rutaBuscada
	rutaBuscada<-rutaBuscada-1
	Escribir "Ingrese el nombre que desea buscar"
	leer nombreBuscado
	
	Para i = 0 Hasta pasajesVendido[rutaBuscada] Hacer
		Si pasajeros[rutaBuscada,i] = nombreBuscado Entonces
			
			Escribir "Nombre y Apellido: ", pasajeros[rutaBuscada, i]
			Escribir "Destino: ", rutasAereas[rutaBuscada]
			Escribir "DNI: ", dni[rutaBuscada, i]
			bandera <- Verdadero
		FinSi
	FinPara
	
	Si no bandera Entonces
		Escribir "Pasajero no encontrado"
	Fin Si
	
	Escribir "Presione una tecla para continuar..."
	leer var
	Limpiar Pantalla
FinSubProceso

SubProceso ordenarListaPasajeros(rutasAereas,pasajesVendido,dni,pasajeros,telefono,asiento,pasajeroFrecuente,equipajePasajero)
	Definir opcionSwitch Como Caracter
	Definir i, j, rutaBuscada Como Entero
	Escribir "Seleccione una opción"
	Escribir "a- Ordenar lista Ascendente"
	Escribir "b- Ordenar lista Descendente"
	Leer opcionSwitch
	Mientras opcionSwitch <> "a" y opcionSwitch <> "A" y opcionSwitch <> "b" y opcionSwitch <> "B" Hacer
		Escribir "Opción inválida. Intente nuevamente"
		Leer opcionSwitch
	FinMientras
	
	Escribir "Ingrese la ruta"
	Para i = 0 Hasta 3 Hacer
		Escribir i+1, " ", rutasAereas[i]
	FinPara
	Leer rutaBuscada
	rutaBuscada <- rutaBuscada - 1
	
	Si opcionSwitch = "a" o opcionSwitch = "A" Entonces
		ordenarAscendente(pasajesVendido, dni, pasajeros, telefono, asiento, pasajeroFrecuente, equipajePasajero, rutaBuscada)
		mostrarLista(pasajesVendido, dni, pasajeros, telefono, asiento, pasajeroFrecuente, equipajePasajero, rutaBuscada)
	finSi
	Si opcionSwitch = "b" o opcionSwitch = "B" Entonces
		ordenarDescendente(pasajesVendido, dni, pasajeros, telefono, asiento, pasajeroFrecuente, equipajePasajero, rutaBuscada)
		mostrarLista(pasajesVendido, dni, pasajeros, telefono, asiento, pasajeroFrecuente, equipajePasajero, rutaBuscada)
	Fin Si
FinSubProceso


SubProceso cantidadPasajesVendidosPorRuta(rutasAereas,pasajesVendido)
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		Escribir rutasAereas[i], " ", pasajesVendido[i]
	Fin Para
FinSubProceso

//PORCENTAJE DE PASAJES VENDIDOS POR CADA VUELO.
//EJ: 30 PASAJES VENDIDOS DEL VUELO 1 = 25% DE 120
SubProceso porcentajeVentasPorRuta(rutasAereas,capacidadPasajeros, pasajesVendido)
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		Escribir "Porcentaje vendido en vuelo: ", rutasAereas[i]," ", (pasajesVendido[i]/capacidadPasajeros[i]*100),"%"
	Fin Para
	Escribir "Presione una tecla para continuar..."
	leer var
	Limpiar Pantalla
FinSubProceso


//SUBPROCESOS PARA ORDENAR ASCENDENTE
SubProceso ordenarAscendente(pasajesVendido, dni, pasajeros, telefono, asiento, pasajeroFrecuente, equipajePasajero, rutaBuscada)
	definir aux como cadena
	Definir temp como entero
	Definir aux2 Como Logico
	Definir i, j Como Entero
	Para i<- 0 Hasta pasajesVendido[rutaBuscada] - 2 Con Paso 1 Hacer
		Para j<-i+1 Hasta pasajesVendido[rutaBuscada] - 1 Con Paso 1 Hacer
			Si asiento[rutaBuscada, i] > asiento[rutaBuscada, j] entonces 
				
				temp <- pasajeroFrecuente[rutaBuscada, j]
				pasajeroFrecuente[rutaBuscada, j] <- pasajeroFrecuente[rutaBuscada, i]
				pasajeroFrecuente[rutaBuscada, i] <- temp
				
				temp <- asiento[rutaBuscada, j]
				asiento[rutaBuscada, j] <- asiento[rutaBuscada, i]
				asiento[rutaBuscada, i] <- temp
				
				aux2 <- equipajePasajero[rutaBuscada, j]
				equipajePasajero[rutaBuscada, j] <- equipajePasajero[rutaBuscada, i]
				equipajePasajero[rutaBuscada, i] <- aux2
				
				aux <- dni[rutaBuscada, j]
				dni[rutaBuscada, j] <- dni[rutaBuscada, i]
				dni[rutaBuscada, i] <- aux
				
				aux <- pasajeros[rutaBuscada, j]
				pasajeros[rutaBuscada, j] <- pasajeros[rutaBuscada, i]
				pasajeros[rutaBuscada, i] <- aux
				
				aux <- telefono[rutaBuscada, j]
				telefono[rutaBuscada, j] <- telefono[rutaBuscada, i]
				telefono[rutaBuscada, i] <- aux
				
			Fin Si
		Fin Para
	Fin Para
FinSubProceso


//SUBPROCESOS PARA ORDENAR DESCENDENTE
SubProceso ordenarDescendente(pasajesVendido, dni, pasajeros, telefono, asiento, pasajeroFrecuente, equipajePasajero, rutaBuscada)
	definir aux como cadena
	Definir temp como entero
	Definir aux2 Como Logico
	Definir i, j Como Entero
	Para i<- 0 Hasta pasajesVendido[rutaBuscada] - 2 Con Paso 1 Hacer
		Para j<-i+1 Hasta pasajesVendido[rutaBuscada] - 1 Con Paso 1 Hacer
			Si asiento[rutaBuscada, i] < asiento[rutaBuscada, j] entonces 
				
				temp <- pasajeroFrecuente[rutaBuscada, j]
				pasajeroFrecuente[rutaBuscada, j] <- pasajeroFrecuente[rutaBuscada, i]
				pasajeroFrecuente[rutaBuscada, i] <- temp
				
				temp <- asiento[rutaBuscada, j]
				asiento[rutaBuscada, j] <- asiento[rutaBuscada, i]
				asiento[rutaBuscada, i] <- temp
				
				aux2 <- equipajePasajero[rutaBuscada, j]
				equipajePasajero[rutaBuscada, j] <- equipajePasajero[rutaBuscada, i]
				equipajePasajero[rutaBuscada, i] <- aux2
				
				aux <- dni[rutaBuscada, j]
				dni[rutaBuscada, j] <- dni[rutaBuscada, i]
				dni[rutaBuscada, i] <- aux
				
				aux <- pasajeros[rutaBuscada, j]
				pasajeros[rutaBuscada, j] <- pasajeros[rutaBuscada, i]
				pasajeros[rutaBuscada, i] <- aux
				
				aux <- telefono[rutaBuscada, j]
				telefono[rutaBuscada, j] <- telefono[rutaBuscada, i]
				telefono[rutaBuscada, i] <- aux
				
				
			Fin Si
		Fin Para
	Fin Para
FinSubProceso

//SUBPROCESO PARA MOSTRAR LISTAS ORDENADAS
SubProceso mostrarLista(pasajesVendido, dni, pasajeros, telefono, asiento, pasajeroFrecuente, equipajePasajero, rutaBuscada)
	Definir i Como Entero
	Para i<-0 Hasta pasajesVendido[rutaBuscada] - 1 Con Paso 1 Hacer
		
		Escribir Sin Saltar pasajeros[rutaBuscada,i], " "
		Escribir Sin Saltar dni[rutaBuscada,i], " "
		Escribir Sin Saltar telefono[rutaBuscada,i], " "
		Escribir Sin Saltar asiento[rutaBuscada,i], " "
		Escribir Sin Saltar pasajeroFrecuente[rutaBuscada,i], " "
		Escribir Sin Saltar equipajePasajero[rutaBuscada,i], " "
		Escribir ""
	Fin Para
	
	Escribir "Presione una tecla para continuar..."
	leer var
	Limpiar Pantalla
FinSubProceso