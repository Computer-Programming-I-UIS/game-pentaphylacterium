class Protagonista { 
 int x, y;
 int px, py;
 int vel, cvel;
 int counter;
 PImage sprite = loadImage("Protagonista.png");
 int a = 0 ,b = 12, c = 4, d = 8;
 boolean miraOn;
 
Protagonista(int _px, int _py, int _vel) { //constructor de la clase
  px = _px;
  py = _py;
  vel = _vel;

}

  void controles(){
    boolean multipleKeys = false;    
    if (keys[0] && keys[1] || keys[1] && keys[2] || keys[2] && keys[3] || keys[3] && keys[0])
       multipleKeys = true; 
       
    if (multipleKeys)
      cvel = vel/2 + vel/3;
    else
      cvel = vel;
      
    if(keys[0] == true && py >= y/48 + 60){ //mover arriba
      py -= cvel;
      delay(15);
      b++;
      counter = b;
      if (b == 15) 
        b = 11;
    }
 
   if(keys[2] == true && py <= height-70){ // mover abajo
     py += vel;
     delay(15);
     a++;
     counter = a;
     if (a == 3) 
       a = -1;
   }
 
   if(keys[3] == true && px >= 20){ // mover izquierda
     px -= vel;
     delay(15);
     c++;
     counter = c;
     if (c == 7) 
       c = 3;
   }
 
   if(keys[1] == true && px <= width - 40){ // mover derecha
     px += vel;
     delay(15);
     d++;
     counter = d;
     if (d == 11)
       d=7;
   }
   
   if(keys[4] == true)
     disparar();
     
   if(keys[5] == true)
     miraOn = !miraOn;
  }
 
  void dibujar() { 
    if(miraOn){
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
  }
  
  void disparar() {
    Disparo bala;
    bala = new Disparo(px+12, py+24, mouseX+6, mouseY+12);
    niveles[numNivel].disparo.add(bala);
  }
  
  float getpx() {
    return px;
  }

  float getpy() {
    return py;
  }
}
