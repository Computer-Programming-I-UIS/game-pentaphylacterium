class Jugador{
  float x, y;
  float vel;
  float r;
  
  Jugador(float _x, float _y, float _vel, float _r) {
    x = _x;
    y = _y;
    vel = _vel;
    r = _r;
  }
  
  void dibujar() {
    //jugador
    noStroke();
    fill(0);
    rectMode(CENTER);
    rect(x, y, r*2, r*4);
    
    //apuntar
    float angle = atan2(mouseY - y, mouseX - x);
    float a = x + 1000*cos(angle);
    float b = y + 1000*sin(angle);
    stroke(255, 0, 0, 180);
    strokeWeight(3);
    line(x, y, a, b);
  }
  
  void controles() {
    if(keys[1] == true && x <= width)
      x += vel;
    if(keys[3] == true && x >= r)
      x -= vel;
    if(x+r > width)
      x = width-r;
    if(x < 0)
      x = 0;
  }
}
