class Disparo {
  float x, y, vel, r;
  PVector direccion = new PVector();
  boolean colision = false;
  
  Disparo(float _x, float _y, float dirX, float dirY){
    x = _x;
    y = _y;
    r = 10;
    
    PVector vjugador = new PVector(x, y);
    PVector vmouse = new PVector(dirX, dirY);
    
    direccion.set(PVector.sub(vmouse, vjugador));
    direccion.normalize();
    direccion.mult(4);
  }
  
  void dibujar() {
    stroke(0, 0, 80);
    fill(180, 108, 255);
    rectMode(CENTER);
    rect(x, y, r, r);
  }
  
  void mover() {
    if(!colision) {
      x += direccion.x;
      y += direccion.y;
    } else{
      r -= 0.5;
      if(r <= 0){
        destruir();
      }
    }
  }
  
  void colisionador() {
    if(x >= width || x+r <= 0 || y >= height || y+r <= 0){
      colisionDetectada();
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
