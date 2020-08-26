class Nivel {

  Protagonista player = new Protagonista(width/2, height/2, 8);
  Enemigo enemigo = new Enemigo(0, round(height/2 + random(-100, 100)), 30);

  boolean ready = false;

  // Escenario escenario;

  ArrayList<Disparo> disparo = new ArrayList();

  void jugar(int[][] obstaculos, int numElemInt) {
    player.dibujar();
    enemigo.dibujar();

    /* UNIR EL ESCENARIO CON EL JUGADOR
     
     player.verificarObstaculos(escenario.pos_interacciones, escenario.numElemInt);
     
     */
    player.verificarObstaculos(obstaculos, numElemInt);
    player.controles();


    for (int numDisparos = 0; numDisparos < disparo.size(); numDisparos ++) {
      Disparo bala = disparo.get(numDisparos);
      if (bala.getColision(enemigo.getpx(), enemigo.getpy(), enemigo.getw(), enemigo.geth())) {
        enemigo.px = 0;
        enemigo.py = round(height/2 + random(-100, 100));
        bala.destruir();
      }
      bala.dibujar();
      bala.mover();
    }

    if (player.getpx() <= 665 && player.getpy() >= 0 && player.getpx() >= 625 && player.getpy() <= 50) {
      siguienteNivel();
    }
    colisiones();
  }

  void siguienteNivel() {
    if (numNivel < 4)
      numVentana = 5;
    else
      numVentana = 6;
    nivel1.stop();
    nivelCompletado.play();
  }

  void colisiones() {
    //si el enemigo toca al jugador
    if (enemigo.getColision(player.getpx(), player.getpy(), 1, 20)) {
      juegoTerminado();
      player.px = width/2;
      player.py = height/2;
      enemigo.px = 0;
      enemigo.py = round(height/2 + random(-100, 100));
    }
  }
}
