class Disparo {
  float x, y, vel, r;
  PVector direccion = new PVector();
  boolean colision = false;
  
  Disparo(float _x, float _y, float dirX, float dirY){
    x = _x;
    y = _y;
    r = round(resizeX(12));
    direccion = getDireccion(dirX, dirY, _x, _y, 7);
  }
  
  void dibujar() {
    stroke(0, 0, 80);
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(x, y, 2*r, r);
    mover();
  }
  
  void mover() {
    if(!colision) {
      x += 2*direccion.x;
      y += 2*direccion.y;
    } else{
        destruir();
      }
  }
  
  void colisionDetectada() {
    for(Disparo bala : niveles[numNivel].disparo) {
      if(bala == this && colision == false) {
        colision = true;
      }
    }
  }
  
  void destruir() {
    for(int i = 0; i < niveles[numNivel].disparo.size(); i++) {
      if(niveles[numNivel].disparo.get(i) == this)
        niveles[numNivel].disparo.remove(i);
    }
  }
}
