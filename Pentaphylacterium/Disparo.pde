class Disparo {
  float x, y;
  int w, h;
  float vel;
  PVector direccion = new PVector();
  boolean colision = false;
  
  Disparo(float _x, float _y, float dirX, float dirY){
    x = _x;
    y = _y;
    w = round(resizeX(24));
    h = round(resizeY(12));
    direccion = getDireccion(dirX, dirY, _x, _y, 7);
  }
  
  void dibujar() {
    stroke(0, 0, 80);
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(x, y, w, h);
    mover();
  }
  
  void mover() {
    colision = false;
    colisionDetectada();
    if(colision == false) {
      x += 2*direccion.x;
      y += 2*direccion.y;
    } else{
        destruir();
      }
  }
  
  void colisionDetectada() {
    if(x + w >= width || x <= w || y + h >= height || y <= 60)
      colision = true;
    else
      colision = false;
  }
  
  void destruir() {
    for(int i = 0; i < niveles[numNivel].disparo.size(); i++) {
      if(niveles[numNivel].disparo.get(i) == this)
        niveles[numNivel].disparo.remove(i);
    }
  }
  
    float getx() {
    return x;
  }
  float gety() {
    return y;
  }
  float getw() {
    return w;
  }
  float geth() {
    return h;
  }
}
