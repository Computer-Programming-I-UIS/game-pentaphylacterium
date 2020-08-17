class Nivel {
  
  Protagonista player = new Protagonista(width/2, height/2, 8);
  boolean ready = false;
  
  ArrayList<Disparo> disparo = new ArrayList();
  
  void jugar(){
    player.dibujar();
    player.controles();
    
    for(int numDisparos = 0; numDisparos < disparo.size(); numDisparos ++){
      Disparo bala = disparo.get(numDisparos);
      bala.dibujar();
    }
  }
}
