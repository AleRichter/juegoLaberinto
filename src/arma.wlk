import wollok.game.*

class Arma {
	
	var property armaTomada = false
	const property position
	
	method image() = "arma2.png"
	
	method tePuedePisar(unObjeto) = true
	
	method tomarArma(){
		game.removeVisual(self)
		armaTomada = true
	}
}
