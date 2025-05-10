object dominic{
  const autos = []
  method comprar(unAuto){
    autos.add(unAuto)
  }
  method autosEnCondiciones(){
    return(autos.filter({auto => auto.estaEnCondiciones()}))
  }
  method trabajar(){
    autos.forEach({auto =>auto.reparar()})
  }
  method probarVelocidad(){
    autos.forEach({auto =>auto.probarVelocidad()})
  }
  method terminarTemporada(){
    autos.clear()
  }
  method promedioVelocidad(){
    return(autos.fold(0,{acum,item=>acum+item.velocidad()}) / autos.size())
  }
  method autoMasRapido(){
    return(autos.max({x=>x.velocidad()}))
  }
  method hayAutoMuyRapido(){
    return(self.autoMasRapido().velocidad() > (self.promedioVelocidad() * 2))
  }
  method autos(){
    return(autos)
  }
}
object ferrari{
  var motor = 87
  const velocidad = 110
  method estaEnCondiciones(){
    return(motor > 64)
  }
  method reparar(){
    motor = 100
  }
  method velocidad(){
    if (motor > 75){
      return(velocidad + 15)
    }
    else{
      return(velocidad)
    }
  }
  method probarVelocidad(){
    motor = motor - 30
  }
}
object flechaRubi{
  var cantidadCombustible = 100
  var property combustible = gasolina
  var color = azul
  method cambiarCombustible(unCombustible){
    combustible = unCombustible
  }
  method estaEnCondiciones(){
    return(
      cantidadCombustible > combustible.nivelMinimo() &&
      color == rojo
    )
  }
  method reparar(){
    cantidadCombustible = cantidadCombustible * 2
    color = color.cambiarColor()

  }
  method probarVelocidad(){
    cantidadCombustible = cantidadCombustible - 5
  }
  method velocidad(){
    return(combustible.bonus(cantidadCombustible))
}
}
object gasolina{
  method nivelMinimo(){
    return(10)
  }
  method bonus(cantCombustible){
    return(cantCombustible + 10)
  }
}
object nafta{
  method nivelMinimo(){
    return(50)
  }
    method bonus(cantCombustible){
    return(-1 * ((cantCombustible * 2) * 0.10))
  }
}
object nitrogeno{
  method nivelMinimo(){
    return(0)
  }
    method bonus(cantCombustible){
    return(cantCombustible * 2 * 10)
  }
}
object rojo{
  method cambiarColor(){
    return(azul)
  }
}
object azul{
  method cambiarColor(){
    return(verde)
  }
}
object verde{
  method cambiarColor(){
    return(rojo)
  }
}
object intocable{
  var condicion = true
  const velocidad = 45
  method estaEnCondiciones(){
    return(condicion)
  }
  method reparar(){
    condicion = true
  }
  method probarVelocidad(){
    condicion = false
  }
  method velocidad(){
    return(velocidad)
  }
}
object superPerrari{
  const velocidad = 140
  var desgasteMotor = 73
  method estaEnCondiciones(){
    return(desgasteMotor < 66)
  }
  method reparar(){
    desgasteMotor = desgasteMotor + 15
  }
  method probarVelocidad(){
    desgasteMotor = desgasteMotor - 15
  }
  method velocidad(){
    return(velocidad - (desgasteMotor * 0.10))
  }
}