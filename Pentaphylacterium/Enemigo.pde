class Enemigo {
  float ipx, ipy;
  float px, py, w, h, vel;
  int numEnemigos;
  boolean activo;
  
    //Constructor
  Enemigo(int _x, int _y, int _vel) {
    ipx = _x;
    ipy = _y;
    px = _x;
    py = _y;
    vel = _vel;
    w = h = random(resizeX(50), resizeX(120));
  }
  
    //Método para dibujar
  void dibujar() {
    PVector direction = getDireccion(niveles[numNivel].player.getpx(), niveles[numNivel].player.getpy(), px, py, vel);
    noStroke();
    fill(200, 0, 0);
    rectMode(CENTER);
    rect(px, py, w, h);
    px += direction.x;
    py += direction.y;
  }
  
  /*void destruir() {
    for (int i = 0; i < niveles[numNivel].enemigos.size(); i++) {
      if (niveles[numNivel].enemigos.get(i) == this)
        niveles[numNivel].enemigos.remove(i);
    }
  }*/
  
  boolean getColision(float x, float y, float W, float H) {
    if (x + W > px && x - W < px + w && y + H > py && y - H < py + h)
      return true;
    else
      return false;
  }
  
  boolean getActivo() {
    return activo;
  }
  
    float getpx() {
    return px;
  }

  float getpy() {
    return py;
  }

  float getw() {
    return w;
  }

  float geth() {
    return h;
  }
  
  float getnumEne() {
    return numEnemigos;
  }
} 
