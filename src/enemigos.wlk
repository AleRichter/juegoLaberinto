import wollok.game.*
import juego.*

class Enemigo{	
	var property position
	var vida = 1
	
	method image()= "monstruo.png"
	
	
	method tePuedePisar(unObjeto) = true
	
	method colisionadoPor(objeto) {
		if(player.estaArmado()) {
			vida -=1
			game.removeVisual(self)
		}
	}
	
	/*
	method tePuedePisar(unObjeto) = true
	
	method producirAccion(){
		if (player.estaArmado()){
			vida -= 1
			game.removeVisual(self)
	    }
	}
	
	*/
	
}