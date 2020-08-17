class Protagonista { 
 int x, y;
 int px, py;
 int vel;
 int counter;
 PImage sprite = loadImage("Protagonista.png");
 int a = 0 ,b = 12, c = 4, d = 8;
 
Protagonista(int _px, int _py, int _vel) { //constructor de la clase
  px = _px;
  py = _py;
  vel = _vel;
}

  void controles(){
  
   if(keys[0] == true && py >= y/48){ //mover arriba
     py -= vel;
     delay(65);
     b++;
     counter = b;
     if (b == 15) 
       b = 11;
    }
 
   if(keys[2] == true && py <= height - 48){ // mover abajo
     py += vel;
     delay(65);
     a++;
     counter = a;
     if (a == 3) 
       a = -1;
   }
 
   if(keys[3] == true && px >= 0){ // mover izquierda
     px -= vel;
     delay(65);
     c++;
     counter = c;
     if (c == 7) 
       c = 3;
   }
 
   if(keys[1] == true && px <= width - 32){ // mover derecha
     px += vel;
     delay(65);
     d++;
     counter = d;
     if (d == 11)
       d=7;
   }
   
   if(keys[4] == true)
     disparar();
  }
 
  void dibujar() { 
        //apuntar
    float angle = atan2(mouseY - py, mouseX - px);
    float ax = px + 1000*cos(angle);
    float by = py + 1000*sin(angle);
    stroke(255, 0, 0, 125);
    strokeWeight(3);
    line(px+12, py+24, ax, by);
    
        //personaje
    x=(counter%4)*32;
    y=(counter/4)*48;
    copy(sprite, x, y, 32, 48, px, py, 32, 48);
  }
  
  void disparar() {
    Disparo bala;
    bala = new Disparo(px, py, mouseX, mouseY);
    niveles[numNivel].disparo.add(bala);
  }
  
}
