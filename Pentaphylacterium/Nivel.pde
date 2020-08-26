class Nivel {
  
  Protagonista player = new Protagonista(width/2, height/2, 8);
  Enemigo enemigo = new Enemigo(3*width/4, height/2, 20);

  
  boolean ready = false;
  
  // Escenario escenario;
  
  ArrayList<Disparo> disparo = new ArrayList();
  
  void jugar(int[][] obstaculos, int numElemInt){
   player.dibujar();
   enemigo.dibujar();
   
    /* UNIR EL ESCENARIO CON EL JUGADOR
    
    player.verificarObstaculos(escenario.pos_interacciones, escenario.numElemInt);
    
    */
    player.verificarObstaculos(obstaculos,numElemInt);
    player.controles();

    
    for(int numDisparos = 0; numDisparos < disparo.size(); numDisparos ++){
      Disparo bala = disparo.get(numDisparos);
      bala.dibujar();
      bala.mover();
    }
  
    if(player.getpx() <= width/4){
      siguienteNivel();
    }
    colisiones();
  }
  
  void siguienteNivel() {
    if(numNivel < 4)
      numVentana = 5;
    else
      numVentana = 6;
    nivel1.stop();
    nivelCompletado.play();
  }
  
  void colisiones() {
    //for (int i = 0; i < enemigos.length; i++) {
      //si el enemigo toca al jugador
      if (enemigo.getColision(player.getpx(), player.getpy(), 32.0, 48.0)){
        juegoTerminado();
        println("Deteccion Colision");
      }
    //}
  }
}
