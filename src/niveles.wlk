import wollok.game.*
import paredes.*
import juego.*
import direcciones.*
import meta.*
import arma.*
import enemigos.*

object nivel1 {
	
	method cargar() {
		
//	PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		var posteParedes = []
		
		(0 .. ancho).forEach{ n => posteParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posteParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posteParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posteParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		posteParedes.remove(new Position(x=4,y=0))//bordeAbajo - la entrada
		posteParedes.remove(new Position(x=2,y=largo))//bordeArriba - la salida
		
		
		posteParedes.addAll([new Position(x=2,y=2), new Position(x=3,y=2), new Position(x=5,y=2),new Position(x=6,y=2)])
		posteParedes.addAll([new Position(x=1,y=3),new Position(x=5,y=3)])
		posteParedes.addAll([new Position(x=1,y=4), new Position(x=3,y=4), new Position(x=5,y=4),new Position(x=6,y=4),new Position(x=7,y=4)])
		posteParedes.addAll([new Position(x=7,y=5)])
		posteParedes.addAll([new Position(x=2,y=6), new Position(x=3,y=6),new Position(x=4,y=6),new Position(x=5,y=6)])
		posteParedes.addAll([new Position(x=7,y=7)])
		
	
		posteParedes.forEach { p => self.crear(new Pared(position = p)) }
		
		
	//	player

		game.addVisual(player)
		game.say(player, player.mensaje())

//	teclado
		keyboard.up().onPressDo{ player.irArriba() }
		keyboard.down().onPressDo{ player.irAbajo() }
		keyboard.left().onPressDo{ player.irIzquierda() }
		keyboard.right().onPressDo{ player.irDerecha() }

//	LLEGADAS
		var metas = [new Position(x=2, y=8)]
			.map{ p => self.crear(new Meta(position = p)) }		
	
//ARMA
		var armas = [new Position(x=1, y=2)]
			.map{ p => self.crear(new Arma(position = p)) }	
		
//ENEMIGOS	
	
		var enemigos = [new Position(x=4, y=2),new Position(x=2, y=5),new Position(x=3, y=7)]
			.map{ p => self.crear(new Enemigo(position = p)) }
	
//Colisiones	
	     game.whenCollideDo(player, { elemento => elemento.tomarArma()
	     player.estaArmado(true)
	     })  
	}
	
	method crear(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
}