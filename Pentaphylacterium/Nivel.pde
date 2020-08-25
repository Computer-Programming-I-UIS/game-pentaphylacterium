class Nivel {
  
  Protagonista player = new Protagonista(width/2, height/2, 8);
  Enemigo enemigo = new Enemigo(3*width/4, height/2, 20, 20);
  boolean ready = false;
  
  // Escenario escenario;
  
  ArrayList<Disparo> disparo = new ArrayList();
  ArrayList<Enemigo> enemigos = new ArrayList();
  
  void jugar(int[][] obstaculos, int numElemInt){
    player.dibujar();
    
    /* UNIR EL ESCENARIO CON EL JUGADOR
    
    player.verificarObstaculos(escenario.pos_interacciones, escenario.numElemInt);
    
    */
    player.verificarObstaculos(obstaculos,numElemInt);
    player.controles();
    //enemigo.dibujar();
    
    for(int numDisparos = 0; numDisparos < disparo.size(); numDisparos ++){
      Disparo bala = disparo.get(numDisparos);
      bala.dibujar();
      bala.mover();
    }
    
    for (int numEne = 0; numEne < enemigos.size(); numEne++) {
        if (enemigos.get(numEne).getActivo())
          enemigos.get(numEne).dibujar();
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
    for (int i = 0; i < enemigos.size(); i++) {
      //si el enemigo toca al jugador
      if (enemigos.get(i).getColision(player.getpx(), player.getpy(), 32, 48))
        juegoTerminado();
  }
  }
}
