class Disparo {
  float x, y;
  int w, h;
  float vel;
  PVector direccion = new PVector();
  boolean colision = false;
  
    //Constructor
  Disparo(float _x, float _y, float dirX, float dirY){
    x = _x;
    y = _y;
    w = round(resizeX(24));
    h = round(resizeY(12));
    direccion = getDireccion(dirX, dirY, _x, _y, 7);
  }
  
    //Método para dibujar
  void dibujar() {
    stroke(0, 0, 80);
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(x, y, w, h);
    mover();
  }
  
    //Método que controla el movimiento
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
  
    //Método para la colision con las paredes
  void colisionDetectada() {
    if(x + w >= width || x <= w || y + h >= height || y <= 60)
      colision = true;
    else
      colision = false;
  }
  
    //Método para destruir los disparos
  void destruir() {
    for(int i = 0; i < niveles[numNivel].disparo.size(); i++) {
      if(niveles[numNivel].disparo.get(i) == this)
        niveles[numNivel].disparo.remove(i);
    }
  }
  
    //Funciones get
  boolean getColision(float X, float Y, float W, float H) {
    if (X + W > x && X - W < x + w && Y + H > y && Y - H < y + h)
      return true;
    else
      return false;
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
