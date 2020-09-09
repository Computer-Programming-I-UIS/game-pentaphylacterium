class Nivel {

  Protagonista player = new Protagonista(round(32*width/36), round(15*height/36), 10);
  Enemigo[] enemigos;
  int enemigosActivos = 1;
  int nivelesSuperados = 0;
  int tNuevoEnemigo_ms = 10000;
  int cantidadEnemigos;

  int t1, t2;

  Nivel(int numEnemigos) {
    t1 = millis();
    cantidadEnemigos = numEnemigos;
    enemigos = new Enemigo[numEnemigos];
    for (int i = 0; i < numEnemigos; i++) {
      float aleatorio = random(0, 1);
      if (aleatorio < 0.5) enemigos[i] = new Enemigo(width + 250, round(height/2 + random(-500, 500)), 24);
      else enemigos[i] = new Enemigo(-250, round(height/2 + random(-500, 500)), 24);
    }
  }

  boolean ready = false;

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

    player.verificarObstaculos(obstaculos, numElemInt);
    player.controles();

    //destriur enemigos con las balas
    for (int numDisparos = 0; numDisparos < disparo.size(); numDisparos ++) {
      Disparo bala = disparo.get(numDisparos);
      for (int i = 0; i < enemigosActivos; i++) {
        if (bala.getColision(enemigos[i].getpx(), enemigos[i].getpy(), enemigos[i].getw(), enemigos[i].geth())) {
          float aleatorio = random(0, 1);
          if (aleatorio < 0.5)
            enemigos[i].px = -250;
          else
            enemigos[i].px = width +250;
          enemigos[i].py = round(height/2 + random(-500, 500));
          bala.destruir();
        }
      }
      bala.dibujar();
      bala.mover();
    }

    //cuando pasa de nivel
    if (player.getpx() <= 665 && player.getpy() >= 0 && player.getpx() >= 620 && player.getpy() <= 50) {
      siguienteNivel();
      for (int i = 0; i < enemigosActivos; i++) {
        player.px = round(32*width/36);
        player.py = round(15*height/36);
        enemigosActivos = 0;
        float aleatorio = random(0, 1);
        if (aleatorio < 0.5)
          enemigos[i].px = 0;
        else
          enemigos[i].px = width + 250;
        enemigos[i].py = round(height/2 + random(-500, 500));
      }
    }
    colisiones();
  }

  void siguienteNivel() {
    nivel1.stop();
    nivel2.stop();
    nivel3.stop();
    if (numNivel == 0) {
      numVentana = 5;
      nivelCompletado.play();
    } else if (numNivel == 1){
      numVentana = 13;
      nivelCompletado.play();
    } else if (numNivel == 2){
      numVentana = 14;
      nivelCompletado.play();
    } else if (numNivel == 3){
      numVentana = 15;
      nivelCompletado.play();
    } else if (numNivel == 4){
      numVentana = 6;
      victoria.play();
    }
  }

  void colisiones() {
    //si el enemigo toca al jugador
    for (int i = 0; i < enemigosActivos; i++) {
      if (enemigos[i].getColision(player.getpx(), player.getpy(), 1, 20)) {
        numVentana = 7;
        nivel1.stop();
        nivel2.stop();
        nivel3.stop();
        die.play();
        player.px = round(32*width/36);
        player.py = round(15*height/36);
        enemigosActivos = 0;
        float aleatorio = random(0, 1);
        if (aleatorio < 0.5)
          enemigos[i].px = -100;
        else
          enemigos[i].px = width + 100;
        enemigos[i].py = round(height/2 + random(-500, 500));
      }
    }
  }
}
