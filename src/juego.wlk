import wollok.game.*
import direcciones.*
import arma.*

object player {
	
	var property position = game.at(4, 0)
	var property direccion = arriba 
	var  estaArmado = false

	var vidas = 3
	
	method image() {
		if (self.estaArmado()){
		  return "guerrero.png"
		}  else {
		  return "guerreroSinArma.png"
	   }
	}
	method mensaje() = "Necesito poder defenderme"
	
//Intento de collide----------------------------------

method estaArmado() = estaArmado

method agarroArma() {estaArmado= true}



//------------------------------------------------------
    
    method juegoTerminado() = vidas == 0
	
	method resetPosition() {
		position = game.at(4, 0)
	}
	
	//method chocarConObjeto(objeto) {estaArmado = objeto.image() == "arma2.png"}
	
	method chocarCon(rival) {
		vidas -= 1
		self.resetPosition()
//		rival.resetPosition()
		if (self.juegoTerminado()) {
			game.stop()
		}
	}
	
//----------------------------------------------------
	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}
	
	method irArriba() {
		direccion = arriba
		self.validarLugarLibre(direccion)
		self.avanzar()
	}
	

	method irAbajo() {
		direccion = abajo
		self.validarLugarLibre(direccion)
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.validarLugarLibre(direccion)
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.validarLugarLibre(direccion)
		self.avanzar()
	}
	
	method avanzar() {
		position = direccion.siguiente(position)
	}
	
	method validarLugarLibre(unaDireccion) {
		const posicionAlLado = unaDireccion.siguiente(position) 
		const lugarLibre = game.getObjectsIn(posicionAlLado).all{ obj => obj.tePuedePisar(self) } //obtengo objetos de la posicion de al lado 
																								  //y pregunta si lo puede pisar el jugador
		if (!lugarLibre) 																		  //si no hay lugar se lanza la excepcion con el mensaje
			throw new Exception(message = "NO PUEDES MOVERTE AHI.")
	
	}

}














