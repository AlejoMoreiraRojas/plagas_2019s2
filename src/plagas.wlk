import elementos.*

class Plagas {
	var property poblacion = null
	
	method nivelDeDanio()
	
	method transmiteEnfermedades(){
		return self.poblacion() >= 10
	}
	
	method afectarElemento(unElemento){
		unElemento.esAfectadoPor(self)
		self.afectarPlaga()
	}
	
	method afectarPlaga(){
		self.poblacion(self.poblacion() * 1.1)
	}
}


class Cucarachas inherits Plagas {
	var property pesoPromedio = null
	
	override method nivelDeDanio(){
		return self.poblacion() / 2
	}
	
	override method transmiteEnfermedades(){
		return super() && self.pesoPromedio() >= 10
	}
	
	override method afectarPlaga(){
		super()
		self.pesoPromedio(self.pesoPromedio() + 2)
	}
}


class Pulgas inherits Plagas {
	
	override method nivelDeDanio(){
		return self.poblacion() * 2
	}	
}


class Garrapatas inherits Pulgas {
	
	override method afectarPlaga(){
		self.poblacion(self.poblacion() * 1.2)
	}
}


class Mosquitos inherits Plagas {
	
	override method nivelDeDanio(){
		return self.poblacion()
	}
	
	override method transmiteEnfermedades(){
		return super() && (self.poblacion() % 3 == 0)
	}
}