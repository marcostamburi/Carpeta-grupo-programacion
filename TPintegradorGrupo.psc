Algoritmo sin_titulo
	Definir rutasAereas, dni, pasajeros, telefono, pasajerosDos como cadena
	Definir cantidadPasajeros, pasajeroFrecuente, pasajesVendido, asiento, opcionMenu Como Entero
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
				ventaPasajes(rutasAereas,pasajesVendido,capacidadPasajeros,dni,pasajeros,telefono,asiento,pasajeroFrecuente)
			2: 
				buscarPasajeVendido(pasajesVendido,asiento)
			3:
				//buscarPasajero()
			4: 
				//ordenarListaPasajeros()
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
					//cantidadPasajesVendidosPorRuta()
				SiNo
					//porcentajeVentasPorRuta()
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

Funcion ventaPasajes(rutasAereas,pasajesVendido,capacidadPasajeros,dni,pasajeros,telefono,asiento,pasajeroFrecuente)
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
	FinSi
	
	Escribir "Ingrese el nombre y apellido del pasajero"
	Leer nombreApellido
	
	Escribir "Ingrese el DNI del pasajero"
	Leer dniPasajero
	
	Escribir  "Ingrese el télefono del pasajero"
	Leer telefonoPasajero
	
	Escribir "¿Tiene equipaje en la bodega? (S/N)"
	Leer equipaje
	
	Si equipaje = "S" o equipaje = "s"
		equipajeBodega <- Verdadero
	Sino 
		Si equipaje = "N" o equipaje = "n"
			equipajeBodega <- Falso
		FinSi
	FinSi
	
	
	Escribir "Número de pasajero frecuente"
	Leer numPasajeroFrecuente
	
	asientoPasajero <- asiento[ruta] +1
	asiento <- asientoPasajero
	
	costoPasaje <- CalcularCostoPasaje(rutasAereas,cantidadPasajeros,equipajeBodega)
	
	pasajeros[ruta-1,asientoPasajero] <- nombreApellido
	dni[ruta-1,asientoPasajero] <- dniPasajero
	telefono[ruta-1,asientoPasajero] <- telefonoPasajero
	pasajeroFrecuente[ruta-1,asientoPasajero] <- numPasajeroFrecuente
	pasajesVendido[ruta-1] <- pasajesVendido[ruta] 
	
	Escribir "Resumen de la venta"
	Escribir "Ruta: ", rutasAereas[ruta]
	Escribir "Nombre y Apellido: ", nombreApellido
	Escribir "DNI: ", dniPasajero
	Escribir "Télefono: ", telefonoPasajero
	Escribir "Equipaje en Bodega: ", equipajeBodega
	Escribir "Número de pasajero frecuente: ", numPasajeroFrecuente
	Escribir "Asiento: ", asientoPasajero
	Escribir "Costo pasaje: $" costoPasaje
	
FinFuncion
Funcion costoPasaje <- CalcularCostoPasaje(rutasAereas,cantidadPasajeros,equipajeBodega)
	Definir costoFinal, costoInical, costoIncremento Como Real
	
	Segun rutasAereas Hacer
		1:
			costoInical <- 150000
			Si cantidadPasajeros > 20 y cantidadPasajeros < 60 Entonces
				
				costoIncremento <- costoInical * 1.1
			FinSi
			Si cantidadPasajeros > 60 Entonces
				
				costoIncremento <- 180000
			FinSi
		2:
			costoInical <- 120000
			Si cantidadPasajeros > 20 y cantidadPasajeros < 60 Entonces
				costoIncremento <- costoInical *1.1
			FinSi
			Si cantidadPasajeros > 60 Entonces
				costoIncremento <- 150000
			FinSi
		3:
			costoInical <- 70000
			Si cantidadPasajeros > 10 y cantidadPasajeros < 40 Entonces
				costoIncremento <- costoInical *1.15
			FinSi
			Si cantidadPasajeros > 40 Entonces
				costoInical <- 95000
			FinSi
		4:	
			costoInical <- 95000
			Si cantidadPasajeros > 10 y cantidadPasajeros < 40 Entonces
				costoIncremento <- costoInical * 1.15
			FinSi
			Si cantidadPasajeros > 40 Entonces
				costoIncremento <- 125000
			FinSi
	FinSegun
	
	Si equipajeBodega = Verdadero Entonces
		costoFinal <- costoIncremento * 1.05
	FinSi
FinFuncion

SubProceso buscarPasajeVendido(pasajesVendido,asiento)
	Definir asientoBuscado, i, j Como Entero
	
	Escribir "Ingrese el número de asiento"
	Leer asientoBuscado 
	
	Para i = 0 Hasta 3 Hacer
		Para j = 0 hasta pasajesVendido[i] Hacer
			Si asiento[i,j] = asientoBuscado Entonces
				
			FinSi
		FinPara
	FinPara
	
	
FinSubProceso
	