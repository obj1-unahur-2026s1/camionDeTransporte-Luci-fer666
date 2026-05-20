import cosas.*

object camion {
    const contenido = []
    method peso() = contenido.sum({q => q.peso()}) + 1000
    method cargar(cosa) { contenido.add(cosa) 
                          cosa.consecuenciaAlCargar()}
    method descarga(cosa) { contenido.remove(cosa) }
    method pesosPares() {
        return contenido.all({q => q.peso().even()})
    }
    method algunaPesa(unPeso){
        return contenido.any({q => q.peso() == unPeso})
    }
    method algunaDePeligro(unPeligro){
        return contenido.find({q => q.peligrosidad() == unPeligro})
    }
    method lasQueSuperanElPeligro(unPeligro){
        return contenido.filter({q => q.peligrosidad() > unPeligro})
    }
    method lasQueSuperanElPeligroDeLaCosa(unaCosa){
        return contenido.filter({q => q.peligrosidad() > unaCosa.peligrosidad()})
    }
    method excedioSuPeso(){
        return self.peso() > 2500
    }
    method puedeCircular(unPeligro){
        return !self.excedioSuPeso() and contenido.all({ q => q.peligrosidad() <= unPeligro })
    }


    method algunaPesaEntre(min, max){
        return contenido.any({q => q.peso().between(min, max)})
    }
    method laMasPesada(){
        return contenido.map({q => q.peso()}).max()
    }
}
