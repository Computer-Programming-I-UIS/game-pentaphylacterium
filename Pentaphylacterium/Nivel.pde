class Nivel {
  
  Protagonista player = new Protagonista(width/2, height/2, 14);
  Enemigo enemigo = new Enemigo(3*width/4, height/2, 20);
  boolean ready = false;
  
  ArrayList<Disparo> disparo = new ArrayList();
  
  void jugar(){
    player.dibujar();
    player.controles();
    enemigo.dibujar();
    
    for(int numDisparos = 0; numDisparos < disparo.size(); numDisparos ++){
      Disparo bala = disparo.get(numDisparos);
      bala.dibujar();
      bala.mover();
    }
  }
}
