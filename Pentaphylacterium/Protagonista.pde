class Protagonista { 
  int x, y;
  int px, py;
  int vel, cvel;
  float recarga = 0;

  boolean miraOn;
  boolean objetoArriba = false;
  boolean objetoAbajo = false;
  boolean objetoIzquierda = false;
  boolean objetoDerecha = false;

  //Constructor
  Protagonista(int _px, int _py, int _vel) {
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
      if (obstaculos[0][n] < px +32 && obstaculos[0][n] + 30 > px && obstaculos[1][n] > py && obstaculos[1][n] < py+48+vel) { // deteccion de elementos abajo
        cnt ++;
      } 
      if (obstaculos[0][n] < px +32 && obstaculos[0][n] + 30 > px && obstaculos[1][n] + 30 < py+48 && obstaculos[1][n] + 30 > py+36-vel) { // deteccion de elementos arriba
        cnt2 ++;
      }
    }
    for (int m = 0; m < numElemInt; m++) {
      if (obstaculos[0][m] < px+32+vel && obstaculos[0][m] + 30 > px+32+vel && obstaculos[1][m] +48 > py+44 && obstaculos[1][m] < py+48) {// deteccion de elementos derecha
        cnt3 ++;
      } 
      if (obstaculos[0][m] + 30 > px-vel && obstaculos[0][m] < px-vel && obstaculos[1][m] + 48 > py+44 && obstaculos[1][m] < py+48) {// deteccion de elementos izquierda
        cnt4 ++;
      }
    }

    if (cnt >0) objetoAbajo = true;
    else objetoAbajo = false;

    if (cnt2 >0) objetoArriba = true;
    else objetoArriba = false;

    if (cnt3 >0) objetoDerecha = true;
    else objetoDerecha = false;

    if (cnt4 >0) objetoIzquierda = true;
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

    if (keys[0] == true  && !objetoArriba) { //mover arriba
      py -= cvel;
      
      x=((frameCount/2)%4)*32;
        y=48*3;
      
    }

    if (keys[2] == true  && !objetoAbajo) { // mover abajo
      py += vel;
    
        x=((frameCount/2)%4)*32;
        y=0;
        
    }

    if (keys[3] == true  && !objetoIzquierda) { // mover izquierda
      px -= vel;
    
        x=((frameCount/2)%4)*32;
        y=48;
       
    }

    if (keys[1] == true  && !objetoDerecha) { // mover derecha
      px += vel;
   
        x=((frameCount/2)%4)*32;
        y=48*2;
      
    }

    if (recarga > 0)
      recarga -= 0.8;

    if (keys[4] == true && recarga <= 0)
      disparar();

    if (keys[5] == true)
      miraOn = !miraOn;
  }

  void dibujar() { 
    if (miraOn) { //puntero
      float angle = atan2(mouseY - py, mouseX - px);
      float ax = px + 2000*cos(angle);
      float by = py + 2000*sin(angle);
      stroke(255, 0, 0, 125);
      strokeWeight(3);
      line(px+12, py+24, ax, by);
    }

    //personaje
    
    copy(sprite, x, y, 32, 48, px, py, 32, 48);

    println(int(objetoAbajo));
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
