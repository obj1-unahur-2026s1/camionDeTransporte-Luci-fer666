object knightRider {
    method consecuenciaAlCargar() {}
    method bulto() = 1 
    method peso() = 500
    method peligrosidad() = 10
}
object bumblebee {
    method bulto() = 2
    method consecuenciaAlCargar() { self.transformarEnRobot() }
    var estaTransformadoEnRobot = false
    method transformarEnRobot() { estaTransformadoEnRobot = true}
    method transformarEnAuto() { estaTransformadoEnRobot = false}
    method peso() = 800
    method peligrosidad(){
        if(estaTransformadoEnRobot){ return 30 }
        else{ return 15 }
    }
}
object paqueteDeLadrillos {
    method consecuenciaAlCargar() { cantidadDeLadrillos = cantidadDeLadrillos + 12 }
    method bulto(){
        if (cantidadDeLadrillos > 301) { return 3}
        else if (cantidadDeLadrillos > 101) {return 2}
        else {return 1}
    }
    var cantidadDeLadrillos = 0
    method cambiarCantidadDeLadrillos(cantidad){ cantidadDeLadrillos = cantidad}
    method peso() = cantidadDeLadrillos * 2
    method peligrosidad() = 2
}
object arenaAGranel {
    method consecuenciaAlCargar() { peso = peso - 10}
    method bulto() = 1
    var peso = 0
    method cambiarPeso(unPeso) {peso = unPeso}
    method peso() = peso
    method peligrosidad() = 1
}
object bateríaAntiaérea {
    method consecuenciaAlCargar() { self.cargarMisiles() }
    method bulto(){
        if (tieneMisiles) { return 2}
        else {return 1}
    }
    var tieneMisiles = false
    method cargarMisiles() { tieneMisiles = true }
    method descargarMisiles() { tieneMisiles = false }
    method peso(){
        if (tieneMisiles) { return 300 }
        else { return 200 }
    }
    method peligrosidad(){
        if (tieneMisiles) { return 100 }
        else { return 0 }
    }
}
object contenedorPortuario {
    method consecuenciaAlCargar() { contenido.forEach({q => q.consecuenciaAlCargar() })}
    method bulto() = 1 + contenido.sum({q => q.bulto()})
    const contenido = []
    method cargar(cosa) = contenido.add(cosa)
    method descargar(cosa) = contenido.remove(cosa)
    method peso() = contenido.sum({q => q.peso()}) + 100
    method peligrosidad(){ 
        if (contenido != []) {
           contenido.map({ q => q.peligrosidad() }).max()}
        else { return 0}
    }
}
object residuosRadioactivos {
    method consecuenciaAlCargar() { peso = peso + 15 }
    method bulto() = 1
    var peso = 0
    method cambiarPeso(unPeso) { peso = unPeso }
    method peso() = peso
    method peligrosidad() = 200
}
object embalajeDeSeguridad {
    method consecuenciaAlCargar() {}
    method bulto() = 2
    var cosaEmbalada = knightRider
    method embalar(cosa) { cosaEmbalada = cosa}
    method peso() = cosaEmbalada.peso()
    method peligrosidad() = cosaEmbalada.peso()/2
}