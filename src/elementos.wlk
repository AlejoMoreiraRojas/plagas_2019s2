import plagas.*

class Barrio {
	const property vecinos = []
	
	method agregar(listaDeElementos){
		vecinos.addAll(listaDeElementos)
	}
	
	method esCopado(){
		const losBuenos = {elemento => elemento.esBueno()}
		const losMalos = {elemento => not elemento.esBueno()}
		
		return vecinos.count(losBuenos) > vecinos.count(losMalos)
	}
}

class Hogar {
	var property mugre = 0
	var property confort = 0
	
	method esBueno(){
		return self.mugre() <= self.confort() / 2 
	}
	
	method esAfectadoPor(unaPlaga){
		self.mugre(self.mugre() + unaPlaga.nivelDeDanio())
	}
}


class Huerta {
	var property capacidadProd = 0
	var property produccionRequerida = 200
	
	method esBueno(){	//Esta parte de la consigna es confusa
		return self.capacidadProd() > self.produccionRequerida()
	}
	
	method esAfectadoPor(unaPlaga){
		self.capacidadProd(self.capacidadProd() - unaPlaga.nivelDeDanio() * 0.1)
		if(unaPlaga.transmiteEnfermedades()){
			self.capacidadProd(self.capacidadProd() - 10)
		}
	}
}


class Mascota {
	var property salud = 0
	
	method esBueno(){
		return self.salud() > 250
	}
	
	method esAfectadoPor(unaPlaga){
		if(unaPlaga.transmiteEnfermedades()){
			self.salud(self.salud() - unaPlaga.nivelDeDanio())
		}
	}
}