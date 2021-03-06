/*
 * definir remiseras y clientes.
 */

object ludmila{
	method precioPorKm() { return 18 }
}

object anaMaria{
	var economicamenteEstable = true
	method precioPorKm() {
		if(economicamenteEstable){
			return 30
		} else {
			return 25
		}
	}
	
	method setEconomicamenteEstable() { 
		economicamenteEstable = not economicamenteEstable
	}
}

object teresa {
	var precio = 22
	method precioPorKm() { return precio}
	method cambiarPrecio(val) {
		precio = val
	}
}

object melina {
	var trabajaPara
	method trabajaPara(cliente) { trabajaPara = cliente }
	method precioPorKm() { return trabajaPara.precioPorKm() - 3 }
}

//Remiseras

object roxana {
	method cobrarACliente(km, cliente){
		return cliente.precioPorKm() * km
	}
}

object gabriela {
	method cobrarACliente(km, cliente) {
		return cliente.precioPorKm() * km * 1.2
	}
}

object mariela {
	method cobrarACliente(km, cliente) {
		/*var importe = cliente.precioPorKm() * km
		if (importe >= 50){
			return importe
		}else{
			return 50
		}*/
		return 50.max(cliente.precioPorKm() * km)
	}
}

object juana {
	method cobrarACliente(km, cliente) {
		/*if(km <= 8){
			return 100
		} else{
			return 200
		}*/
		return if (km <=8) 100 else 200
	}
}

object lucia {
	var reemplaza
	method reemplaza(remisera){ reemplaza = remisera }
	method cobrarACliente(km, cliente) { return reemplaza.cobrarACliente(km, cliente)}
}

//Oficina

object oficina {
	var primerOpcion
	var segundaOpcion
	
	method asignarRemiseras(remisera1, remisera2) {
		primerOpcion = remisera1
		segundaOpcion = remisera2
	}
	
	method cambiarPrimerRemiseraPor(remisera) {
		primerOpcion = remisera
	}
	
	method cambiarSegundaRemiseraPor(remisera) {
		segundaOpcion = remisera
	}
	
	method intercambiarRemiseras() {
		var aux = segundaOpcion
		primerOpcion = segundaOpcion
		segundaOpcion = aux
	}
	
	method remiseraElegidaParaViaje(km, cliente) {
		var importePrimerOpcion = primerOpcion.cobrarACliente(km, cliente)
		var importeSegundaOpcion = segundaOpcion.cobrarACliente(km, cliente)
		var diferencia = (importeSegundaOpcion - importePrimerOpcion).abs()
		if(diferencia > 30){
			return segundaOpcion
		}else{
			return primerOpcion
		}
	}
}