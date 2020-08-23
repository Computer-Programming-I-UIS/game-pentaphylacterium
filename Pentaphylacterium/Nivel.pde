class Nivel {
  
  Protagonista player = new Protagonista(width/2, height/2, 14);
  Enemigo enemigo = new Enemigo(3*width/4, height/2, 20);
  boolean ready = false;
  
  ArrayList<Disparo> disparo = new ArrayList();
  ArrayList<Enemigo> enemigos = new ArrayList();
  
  void jugar(){
    player.dibujar();
    player.controles();
    enemigo.dibujar();
    
    for(int numDisparos = 0; numDisparos < disparo.size(); numDisparos ++){
      Disparo bala = disparo.get(numDisparos);
      bala.dibujar();
      bala.mover();
    }
    
    for (int numEne = 0; numEne < enemigos.size(); numEne++) {
        if (enemigos.get(numEne).getActivo())
          enemigos.get(numEne).dibujar();
      }
    
    if(player.getpx() <= 21){
      siguienteNivel();
    }
  }
  
  void siguienteNivel() {
    if(numNivel < 4)
      numVentana = 5;
    else
      numVentana = 6;
  }
}
