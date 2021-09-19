object fredy {
	
	var victima
	var salud 
	
	
	method asustar() {
		victima.asustate()
	}
	
	method cambiarVictima(nueva){
		victima = nueva
	}
	
	method sufreAtaque(potencia){
		salud = if (potencia > 100) "lastimado" else "bien"
	}
	
	method saludable() = salud.size() < 5
}


object juancito{
	
	var pulsaciones = 60 
	
	method asustate(){
		pulsaciones = pulsaciones *2
	}
	
	method sufreAtaque(potencia){
		pulsaciones = pulsaciones - potencia
	}
	
	method estaAsustado() {
		return pulsaciones > 100
	}
	
	method seMurio() = pulsaciones <= 0
}


object susanita {

	method asustate() {}
	method sufreAtaque(potencia) {}
	
	method estaAsustado() {
		return false
	}
	method seMurio() {
		return false
	}
}


object tito {

	var asustado = false
	
	method asustate(){
		asustado = true
	}
	method estaAsustado() = asustado
	
	method sufreAtaque(potencia) {
	   self.asustate()		
	}
	method saludable() = not self.estaAsustado()
}

object jason {
	
	var potencia = 100
	var ultimaVictima

	method atacar(alguien){
		
		alguien.sufreAtaque(potencia) 
		ultimaVictima = alguien
		
	}
	
	method potenciar(){
		potencia = potencia + 20
	}
	
	method ganador() {
		return not ultimaVictima.saludable()
	}
}

object bruja(){
	method hechizar(personaje){
		personaje.
	}
}

/*unificar idea de muerto / no saludable, para faciliar ataques y sustos
agregar nuevo monstruo
incorporar la idea de lugar, por ejemplo casa abandonada, un parque de divesiones

y que en ese lugar hay uno de los mostruos y que cuanto alguien lo visita, dicho monstruo lo ataca o asusta, segun corresponda
hacer/arreglar  tests */