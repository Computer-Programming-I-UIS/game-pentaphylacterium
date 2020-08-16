class Nivel {
  
  Jugador jugador = new Jugador(30, height/2, 2, 10);
  boolean ready = false;
  
  void jugar(){
    jugador.dibujar();
    jugador.controles();
  }
}
