class Enemigo {
  float ipx, ipy;
  float px, py, w, h, vel;
  boolean activo;
  
  Enemigo(float _x, float _y, float _vel) {
    ipx = _x;
    ipy = _y;
    px = _x;
    py = _y;
    vel = _vel;
    w = h = random(resizeX(40), resizeX(100));
  }
  
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
    for (int i = 0; i < nivel.enemigos.size(); i++) {
      if (nivel.enemigos.get(i) == this)
        nivel.enemigos.remove(i);
    }
  }*/
  
  boolean getColision(float x, float y, float W, float H) {
    if (x + W > px && x - W < px + w && y + H > py && y - h < py + h)
      return true;
    else
      return false;
  }
  
  boolean getActivo() {
    return activo;
  }
} 
