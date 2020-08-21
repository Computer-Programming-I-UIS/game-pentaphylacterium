class Enemigo {
  float ipx, ipy;
  float px, py, w, h, vel;
  
  Enemigo(float _x, float _y, float _vel) {
    ipx = _x;
    ipy = _y;
    px = _x;
    py = _y;
    vel = _vel;
    w = h = random(resizeX(60), resizeX(110));
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
} 
