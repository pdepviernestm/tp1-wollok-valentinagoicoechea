object verdurin{
    var cajonesVerduras = 10
    const velocidadMax = 80
    const kilosCajones = 5000
    var kilometraje = 700000
    var velocidadActual = 70 //para ver si permito el paso en rutatlantica

    //se le puede indicar en cualquier momento la cantidad de cajones para transportar
    
    method pesoCarga() = cajonesVerduras*kilosCajones
    method velMax() = velocidadMax - ((self.pesoCarga())/500).floor()

    method velActual() = velocidadActual

    method nuevaVelActual(nuevaVelocidad){
        if(nuevaVelocidad <= velocidadMax)
            velocidadActual = nuevaVelocidad
    }

    method recorrioEnKilometros(kmRecorridos) {
        kilometraje = kilometraje+ kmRecorridos
    } //solo registra sus kilometros recorridos
    
    method cantidadCajones(nuevaCantidad) {
        cajonesVerduras = nuevaCantidad
    }

    method kilometraje() = kilometraje //para informar 
}

object scanion5000{
    const carga = 5000 //en litros, el volumen del camion es litros dividido mil, asi obtenemos metros cubicos
    const velocidadMax = 140
    var velocidadActual = 60
    var densidadLiquidoTransportado = 9  //Peso depende de la densidad del liquido transportado
    var kilometraje = 0 //por inicializar un valor, el mismo solo sirve para informar

    method liquidoTransportado(nuevaDensidad){ //varia por cada viaje
        densidadLiquidoTransportado = nuevaDensidad
    }
    method velMax() = velocidadMax
    method pesoCarga() = densidadLiquidoTransportado *(carga/1000)

    method recorrioEnKilometros(kmRecorridos){
        kilometraje = kilometraje + kmRecorridos
    }

    method nuevaVelActual(nuevaVelocidad){
        if(nuevaVelocidad <= velocidadMax)
            velocidadActual = nuevaVelocidad
    }

    method velActual() = velocidadActual

    method kilometraje() = kilometraje //para informar


}

object cerealitas{
    var nivelDeDeterioro = 0 //No puede modificarse eternamente, aumenta al hacer viajes
    var velocidadActual = 50 //por decir algo
    var carga= 0 //Varia por cada viaje

    method nuevoCargamento(nuevaCarga) {
        carga= nuevaCarga
    }

    method pesoCarga() = carga
    
    method velMax() {
        if (nivelDeDeterioro<10) {
            return 40
        } else if(nivelDeDeterioro >= 10 && nivelDeDeterioro <60) {
            return (60-nivelDeDeterioro) //asi no quedan velocidades negativas
        } else{
            return 0
        }
    }

    method velActual() = velocidadActual

    method nuevaVelActual(nuevaVelocidad){ 
        if(nuevaVelocidad <= self.velMax())
            velocidadActual = nuevaVelocidad
    }

    method kmPorHoraQueExcede(){ 
        if (velocidadActual>45){
            return (velocidadActual - 45) //devuelve los kilometros que exceden 45
        } else{
            return 0 //si la velocidad no excede de 45, asi no quedan niveles negativos
        }
    }

    method deterioro(){
        nivelDeDeterioro = nivelDeDeterioro + self.kmPorHoraQueExcede()
    }


}

object rutatlantica{
    const adicionalPorKilos = 100
    //const ubicacionEnKM = 400 //no se donde se debería usar, no se menciona nada de cambiar los kilometros o que eso afecte a los vehiculos
    const velocidadMaxPuesto = 75
    method cargaAdicional(vehiculo) = ((vehiculo.pesoCarga() /1000)).floor()*adicionalPorKilos

    method cobro(vehiculo) {
        return 7000 + self.cargaAdicional(vehiculo) 
    }

    method puedePasar(vehiculo){
        return vehiculo.velActual() <= velocidadMaxPuesto
    }

    method pasarVehiculo(vehiculo) = 
        if(self.puedePasar(vehiculo)){
            self.cobro(vehiculo)
        }
        else 0 //si no puede pasar? 
    }

