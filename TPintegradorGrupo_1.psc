Algoritmo sin_titulo
	Definir rutasAereas, dni, pasajeros, telefono, pasajerosDos como cadena
	Definir cantidadPasajeros, pasajeroFrecuente, pasajesVendido, asiento, opcionMenu,dniLong, telLong Como Entero
	Definir opcionSwitch Como Caracter
	Definir equipajePasajero Como Logico
	Dimension rutasAereas[4], capacidadPasajeros[4], pasajesVendido[4], dni[4,100], asiento[4], pasajeros[4,120],telefono[4,100]
	Dimension pasajeroFrecuente[4,100], equipajePasajero[4,120]
	
	
	
	
	rutasAereas[0] <- "Buenos Aires - Bariloche"
	rutasAereas[1] <- "Buenos Aires - Salta"
	rutasAereas[2] <- "Rosario - Buenos Aires"
	rutasAereas[3] <- "Mar Del Plata - Mendoza"
	
	capacidadPasajeros[0] <- 120
	capacidadPasajeros[1] <- 120 
	capacidadPasajeros[2] <- 80
	capacidadPasajeros[3] <- 80
	
	pasajesVendido[0]<- 0
	pasajesVendido[1] <- 0
	pasajesVendido[2] <- 0
	pasajesVendido[3] <- 0
	
	asiento[0] <- 0
	asiento[1] <- 0
	asiento[2] <- 0
	asiento[3] <- 0
	
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
			6: 
				Escribir "ADIOS PANITA"
			De Otro Modo:
				Escribir "Opción inválida. Intente nuevamente"
				
				
				
				
		FinSegun
	Hasta Que opcionMenu = 6 
	
	
	

FinAlgoritmo

SubProceso mostrarMenu()
	Escribir "Bienvenido al sistema de venta de pasajes"
	Escribir "1- Venta de pasajes"
	Escribir "2- Buscar pasaje vendido"
	Escribir "3- Buscar pasajero"
	Escribir "4- Ordenar y mostrar lista pasajeros"
	Escribir "a. Por número de asiento Ascendente"
	Escribir "b. Por número de asiento Descendente"
	Escribir "5- Listado/s"
	Escribir "a. Cantidad de pasajes vendido por ruta aérea"
	Escribir "b. Porcentaje de ventas por ruta aérea"
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
	
	ruta <- ruta - 1 
	
	Si pasajesVendido[ruta] = capacidadPasajeros[ruta] Entonces
		Escribir "No hay pasajes disponibles"
	SiNo
		pasajesVendido[ruta]<-pasajesVendido[ruta]+1
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
		
		
		asientoPasajero <- asiento[ruta]
		asiento[ruta]<-asiento[ruta]+1
		
		costoPasaje <- CalcularCostoPasaje(ruta,cantidadPasajeros,equipajeBodega)
		
		equipajePasajero[ruta,asientoPasajero]<- equipajeBodega
		pasajeros[ruta,asientoPasajero] <- nombreApellido
		dni[ruta,asientoPasajero] <- dniPasajero
		telefono[ruta,asientoPasajero] <- telefonoPasajero
		pasajeroFrecuente[ruta,asientoPasajero] <- numPasajeroFrecuente
		pasajesVendido[ruta] <- pasajesVendido[ruta] 
		
		Escribir "Resumen de la venta"
		Escribir "Ruta: ", rutasAereas[ruta]
		Escribir "Nombre y Apellido: ", nombreApellido
		Escribir "DNI: ", dniPasajero
		Escribir "Télefono: ", telefonoPasajero
		Escribir "Equipaje en Bodega: ", equipajeBodega
		Escribir "Número de pasajero frecuente: ", numPasajeroFrecuente
		Escribir "Asiento: ", asientoPasajero+1
		Escribir "Costo pasaje: $", costoPasaje
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
	Escribir "Ingrese la ruta"
	Leer rutaBuscada
	rutaBuscada<-rutaBuscada-1
	Escribir "Ingrese el número de asiento"
	Leer asientoBuscado
	asientoBuscado<-asientoBuscado-1
	Para i<-0 Hasta pasajesVendido[rutaBuscada] Con Paso 1 Hacer
		Si i=asientoBuscado Entonces
			Escribir "Nombre y Apellido: ", pasajeros[rutaBuscada, i]
			Escribir "Destino: ", rutasAereas[rutaBuscada]
			Escribir "DNI: ", dni[rutaBuscada, i] 
		Fin Si
	Fin Para
	
	
FinSubProceso

SubProceso buscarPasajero(pasajesVendido, pasajeros, dni, rutasAereas)
	Definir  i, j, rutaBuscada Como Entero
	Definir nombreBuscado Como Caracter
	Escribir "Ingrese la ruta"
	Leer rutaBuscada
	rutaBuscada<-rutaBuscada-1
	Escribir "Ingrese el nombre que desea buscar"
	leer nombreBuscado
	
	Para i = 0 Hasta pasajesVendido[rutaBuscada] Hacer
		Si pasajeros[rutaBuscada,i] = nombreBuscado Entonces
			
			Escribir "Nombre y Apellido: ", pasajeros[rutaBuscada, i]
			Escribir "Destino: ", rutasAereas[rutaBuscada]
			Escribir "DNI: ", dni[rutaBuscada, i]
			
		FinSi
	FinPara
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
	Leer rutaBuscada
	
	Si opcionSwitch = "a" o opcionSwitch = "A" Entonces
		//ordenarAscendenteCadena(rutasAereas)
		//ordenarAscendenteCadena(dni)
		//ordenarAscendenteCadena(pasajeros)
		//ordenarAscendenteCadena(telefono)
		
		//ordenarAscendenteEntero(pasajeroFrecuente)
		//ordenarAscendenteEntero(pasajesVendido)
		//ordenarAscendenteEntero(asiento)
	FinSi
	Si opcionSwitch = "b" o opcionSwitch = "B" Entonces
		//ordenarDescendente()
	Fin Si
FinSubProceso


SubProceso cantidadPasajesVendidosPorRuta(rutasAereas,pasajesVendido)
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		Escribir rutasAereas[i], " ", pasajesVendido[i]
	Fin Para
FinSubProceso


SubProceso porcentajeVentasPorRuta(rutasAereas,capacidadPasajeros, pasajesVendido)
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		Escribir "Porcentaje vendido en vuelo: ", rutasAereas[i]," ", (pasajesVendido[i]/capacidadPasajeros[i]*100),"%"
	Fin Para
	Escribir "Presione una tecla para continuar..."
	leer var
FinSubProceso






//SUBPROCESOS PARA ORDENAR
//SubProceso ordenarAscendenteCadena(array)
	
//FinSubProceso
//SubProceso ordenarAscendenteEntero(array)
	
//FinSubProceso
//SubProceso ordenarDescendenteCadena(array)
//	
//FinSubProceso
//SubProceso ordenarDescendenteEntero(array)
//	
//FinSubProceso
//SubProceso ordenarAscendenteBool(array)
//	
//FinSubProceso
//SubProceso ordenarDescendenteBool(array)
//	
//FinSubProceso


	