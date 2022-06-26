import wollok.game.*

class Arma {
	
	var property armaTomada = false
	const property position
	
	method image() = "arma2.png"
	
	method tePuedePisar(unObjeto) = true
	
	method colisionadoPor(objeto) {
		game.removeVisual(self)
		objeto.agarroArma()
		armaTomada= true
	}
	
	/*method producirAccion(){
		game.removeVisual(self)
		armaTomada = true
	}
	*/
}
