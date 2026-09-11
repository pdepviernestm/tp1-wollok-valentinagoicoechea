object verdurin{
    var cajonesVerduras = 10
    const velocidadMax = 80
    const kilosCajones = 50
    var kilometraje = 700000 // no se su uso todavia
    
    method carga() = cajonesVerduras*kilosCajones
    method velMax() = velocidadMax - (self.carga())/500 // cual para redondear????
}

object scanion5000{
    const carga = 5000 //en litros
    const velocidadMax = 140
    const densidadLiquidoTransportado = 9  //Peso depende de la densidad del liquido transportado

    method velMax() = velocidadMax
    method carga() = carga * densidadLiquidoTransportado
}

object cerealitas{
    var nivelDeDeterioro = 0 //No puede modificarse eternamente
    const velocidadActual = 50 //por decir algo
    //Cantidad de carga varia por viaje
    
    method velMax() {
        if (nivelDeDeterioro<10) {
            return 40
        } else {
            return (60-nivelDeDeterioro)
            }
    }
    method kmPorHoraQueExcede(){ 
        if (velocidadActual>45){
            return (velocidadActual - 45)
        }
    }

    method deterioro(){
        nivelDeDeterioro = nivelDeDeterioro + self.kmPorHoraQueExcede()
    }

    method carga() = 10 //Por poner algo, no se su carga todavia, varia por cada viaje

}

object rutatlantica{
    const adicionalPorKilos = 100
    method cargaAdicional(vehiculo) = (vehiculo.carga() /1000)*adicionalPorKilos

    method cobro(vehiculo) {
        return 7000 + self.cargaAdicional(vehiculo) 
    }

    //camion que pasa por este puesto recorre 400kms y debe ir a un maximo de 75km/h


}
