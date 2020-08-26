class Enemigo {
  float ipx, ipy;
  float px, py, w =80, h=96, vel;
  int x ;
  int y ;
  boolean activo;
  PImage enemigo = loadImage("Enemigo01.png");

  //Constructor
  Enemigo(int _x, int _y, int _vel) {
    ipx = _x;
    ipy = _y;
    px = _x;
    py = _y;
    vel = _vel;
    
  }

  //Método para dibujar
  void dibujar() {
    PVector direction = getDireccion(niveles[numNivel].player.getpx(), niveles[numNivel].player.getpy(), px, py, vel);
    noStroke();
    /*fill(200, 0, 0);
    rectMode(CENTER);
    rect(px, py, w, h);*/
   
    px += direction.x;
    py += direction.y;
    x= int(px);
    y= int(py);
    copy(enemigo,0,0,80,96,x,y,80,96);
    
   
  
    
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
