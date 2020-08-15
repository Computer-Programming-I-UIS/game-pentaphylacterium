class Protagonista { 
  
 float x;
 float y;
 PImage sprite = loadImage("Protagonista.png");
  
 
Protagonista(float posx, float posy) { //constructor de la clase
  x = posx;
  y = posy;
  
}

 
  void display() { 
  image(sprite, x, y);
  }
  
  
}
