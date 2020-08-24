class Protagonista { 
  int x, y;
  int px, py;
  int vel, cvel;
  int counter;
  PImage sprite = loadImage("Protagonista.png");
  int a = 0, b = 12, c = 4, d = 8;
  boolean miraOn;
  float recarga = 0;



  boolean objetoArriba = false;
  boolean objetoAbajo = false;
  boolean objetoIzquierda = false;
  boolean objetoDerecha = false;

  Protagonista(int _px, int _py, int _vel) { //constructor de la clase
    px = _px;
    py = _py;
    vel = _vel;
  }

  void verificarObstaculos(int[][] obstaculos, int numElemInt) {
    int cnt = 0;
    int cnt2 = 0;
    int cnt3 = 0;
    int cnt4 = 0;
    
    for (int n = 0; n < numElemInt; n++) {
      if (obstaculos[0][n] < px && obstaculos[0][n] + 30 > px && obstaculos[1][n] > py+48 && obstaculos[1][n] < py+48+vel) {
        cnt ++;
      } 
      if (obstaculos[0][n] < px && obstaculos[0][n] + 30 > px && obstaculos[1][n] + 30 < py+30 && obstaculos[1][n] + 30 > py+30-vel) {
        cnt2 ++;
      }
     
    }
    for (int m = 0; m < numElemInt; m++) {
      if (obstaculos[0][m] < px+32+vel && obstaculos[0][m] + 30 > px+32+vel && obstaculos[1][m] +48 > py && obstaculos[1][m] < py+48) {
        cnt3 ++;
      } 
      if (obstaculos[0][m] + 30 > px-vel && obstaculos[0][m] < px-vel && obstaculos[1][m] + 48 > py && obstaculos[1][m] < py+48) {
        cnt4 ++;
      }
     
    }
    
    if(cnt >0) objetoAbajo = true;
    else objetoAbajo = false;
    
    if(cnt2 >0) objetoArriba = true;
    else objetoArriba = false;
    
    if(cnt3 >0) objetoDerecha = true;
    else objetoDerecha = false;
    
    if(cnt4 >0) objetoIzquierda = true;
    else objetoIzquierda = false;
    
  }

  void controles() {
    boolean multipleKeys = false;    
    if (keys[0] && keys[1] || keys[1] && keys[2] || keys[2] && keys[3] || keys[3] && keys[0])
      multipleKeys = true; 

    if (multipleKeys)
      cvel = vel/2 + vel/3;
    else
      cvel = vel;

    if (keys[0] == true && py >= y/48 + 60 && !objetoArriba) { //mover arriba
      py -= cvel;
      delay(15);
      b++;
      counter = b;
      if (b == 15) 
        b = 11;
    }

    if (keys[2] == true && py <= height-70 && !objetoAbajo) { // mover abajo
      py += vel;
      delay(15);
      a++;
      counter = a;
      if (a == 3) 
        a = -1;
    }

    if (keys[3] == true && px >= 20 && !objetoIzquierda) { // mover izquierda
      px -= vel;
      delay(15);
      c++;
      counter = c;
      if (c == 7) 
        c = 3;
    }

    if (keys[1] == true && px <= width - 40 && !objetoDerecha) { // mover derecha
      px += vel;
      delay(15);
      d++;
      counter = d;
      if (d == 11)
        d=7;
    }

    if (recarga > 0)
      recarga -= 0.8;

    if (keys[4] == true && recarga <= 0)
      disparar();

    if (keys[5] == true)
      miraOn = !miraOn;
  }

  void dibujar() { 
    if (miraOn) {
      //apuntar
      float angle = atan2(mouseY - py, mouseX - px);
      float ax = px + 1000*cos(angle);
      float by = py + 1000*sin(angle);
      stroke(255, 0, 0, 125);
      strokeWeight(3);
      line(px+12, py+24, ax, by);
    }

    //personaje
    x=(counter%4)*32;
    y=(counter/4)*48;
    copy(sprite, x, y, 32, 48, px, py, 32, 48);
    
    text(int(objetoAbajo),100,100);
  }

  void disparar() {
    Disparo bala;
    bala = new Disparo(px+12, py+24, mouseX+6, mouseY+12);
    niveles[numNivel].disparo.add(bala);
    recarga = 3;
  }

  float getpx() {
    return px;
  }

  float getpy() {
    return py;
  }
}
