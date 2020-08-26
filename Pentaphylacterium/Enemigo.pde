class Enemigo {
  float ipx, ipy;
  float px, py, w, h, vel;
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

  boolean getColision(float x, float y, float W, float H) {
    if (x + W/2 > px && x - W/2 < px + w && y + H/2 > py && y - H/2 < py + h)
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

  /*float getnumEne() {
    return numEnemigos;
  }*/
} 
