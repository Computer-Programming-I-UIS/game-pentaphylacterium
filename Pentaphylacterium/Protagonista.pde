class Protagonista { 
  
 int x;
 int y;
 int px;
 int py;
 int xvel=5;
 int yvel=5;
 int counter;
 PImage sprite = loadImage("Protagonista.png");
  
 
Protagonista(int posx, int posy) { //constructor de la clase
  px = posx;
  py = posy;
  
}

void mover(){
  
 if(isUp){
   py-=yvel;
   
   x=(counter%4)*32;
   y=(counter/4)*48;
  copy(sprite,x,y,32,48,px,py,32,48);
  delay(100);
  counter=12;
  if (counter==15) counter=13;
 }
 
 if(isDown){
   py+=yvel;
   
   x=(counter%4)*32;
   y=(counter/4)*48;
  copy(sprite,x,y,32,48,px,py,32,48);
  delay(100);
  counter=0;
  if (counter==3) counter=0;
 }
 
 if(isLeft){
   px-=xvel;
   
   x=(counter%4)*32;
   y=(counter/4)*48;
  copy(sprite,x,y,32,48,px,py,32,48);
  delay(100);
  counter=4;
  counter++;
  if (counter==7) counter=4;
 }
 
 if(isRight){
   px+=xvel;
   
   x=(counter%4)*32;
   y=(counter/4)*48;
  copy(sprite,x,y,32,48,px,py,32,48);
  delay(100);
  counter=8;
  counter++;
  if (counter==11) counter=8;
 }
 
}
 
  void display() { 
    x=(counter%4)*32;
    y=(counter/4)*48;
  copy(sprite,x,y,32,48,px,py,32,48);
  }
  
  
}

void keyPressed() {
  setMove(keyCode, true);
}
 
void keyReleased() {
  setMove(keyCode, false);
}
 
boolean setMove(int k, boolean b) {
  switch (k) {
  case UP:
    return isUp = b;
 
  case DOWN:
    return isDown = b;
 
  case LEFT:
    return isLeft = b;
 
  case RIGHT:
    return isRight = b;
 
  default:
    return b;
  }
}
