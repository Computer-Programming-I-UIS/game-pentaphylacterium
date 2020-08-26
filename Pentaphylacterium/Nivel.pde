class Nivel {

  Protagonista player = new Protagonista(33*width/36, height/2, 8);
  Enemigo[] enemigos;
  int enemigosActivos = 1;
  int tNuevoEnemigo_ms = 10000;
  int cantidadEnemigos;

  int t1, t2;

  Nivel(int numEnemigos) {
    t1 = millis();
    cantidadEnemigos = numEnemigos;
    enemigos = new Enemigo[numEnemigos];
    for (int i = 0; i < numEnemigos; i++) {
      float aleatorio = random(0, 1);
      if (aleatorio < 0.5) enemigos[i] = new Enemigo(width, round(height/2 + random(-500, 500)), 30);
      else enemigos[i] = new Enemigo(0, round(height/2 + random(-500, 500)), 30);
    }
  }

  boolean ready = false;

  // Escenario escenario;

  ArrayList<Disparo> disparo = new ArrayList();

  void jugar(int[][] obstaculos, int numElemInt) {
    t2 = millis();
    if (t2 - t1 > tNuevoEnemigo_ms) {
      t1 = t2;  //reinicia el cronometro
      if (enemigosActivos < cantidadEnemigos) enemigosActivos++;
    }

    player.dibujar();
    for (int i = 0; i < enemigosActivos; i++) {
      enemigos[i].dibujar();
    }
    /* UNIR EL ESCENARIO CON EL JUGADOR
     
     player.verificarObstaculos(escenario.pos_interacciones, escenario.numElemInt);
     
     */
    player.verificarObstaculos(obstaculos, numElemInt);
    player.controles();

    //destriur enemigos con las balas
    for (int numDisparos = 0; numDisparos < disparo.size(); numDisparos ++) {
      Disparo bala = disparo.get(numDisparos);
      for (int i = 0; i < enemigosActivos; i++) {
        if (bala.getColision(enemigos[i].getpx(), enemigos[i].getpy(), enemigos[i].getw(), enemigos[i].geth())) {
          float aleatorio = random(0, 1);
          if (aleatorio < 0.5)
            enemigos[i].px = 0;
          else
            enemigos[i].px = width;
          enemigos[i].py = round(height/2 + random(-500, 500));
          bala.destruir();
        }
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
      numVentana = 0;
    nivel1.stop();
    nivelCompletado.play();
  }

  void colisiones() {
    //si el enemigo toca al jugador
    for (int i = 0; i < enemigosActivos; i++) {
      if (enemigos[i].getColision(player.getpx(), player.getpy(), 1, 20)) {
        numVentana = 7;
        nivel1.stop();
        die.play();
        player.px = 33*width/36;
        player.py = height/2;
        enemigosActivos = 0;
        float aleatorio = random(0, 1);
        if (aleatorio < 0.5)
          enemigos[i].px = 0;
        else
          enemigos[i].px = width;
        enemigos[i].py = round(height/2 + random(-500, 500));
      }
    }
  }
}
