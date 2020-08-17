class Protagonista { 
 int x;
 int y;
 int px;
 int py;
 int xvel=5;
 int yvel=5;
 int counter;
 PImage sprite = loadImage("Protagonista.png");
 int a=0 ,b = 12, c=4, d=8;
  
 
Protagonista(int posx, int posy) { //constructor de la clase
  px = posx;
  py = posy;
  
}

void mover(){
  
 if(isUp == true){
   py-=yvel;
  delay(150);
  b++;
  counter=b;
  if (b==15) b=11;
 }
 
 if(isDown){
   py+=yvel;
  delay(150);
  a++;
  counter=a;
  if (a==3) a=-1;
 }
 
 if(isLeft){
   px-=xvel;
  delay(150);
  c++;
  counter=c;
  if (c==7) c=3;
 }
 
 if(isRight){
   px+=xvel;
  delay(150);
  d++;
  counter=d;
  if (d==11) d=7;
 }
}
 
  void display() { 
    x=(counter%4)*32;
    y=(counter/4)*48;
  copy(sprite,x,y,32,48,px,py,32,48);
  
  //apuntar
    float angle = atan2(mouseY - py, mouseX - px);
    float ax = px + 1000*cos(angle);
    float by = py + 1000*sin(angle);
    stroke(255, 0, 0, 180);
    strokeWeight(3);
    line(px, py+24, ax, by);
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
