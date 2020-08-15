/****************************************************
Autores:
  *Santiago Gutierrez Valderrama
  *Luis Fernando Romero Rojas

Descripción:
  

Características:
  
****************************************************/

Protagonista player;
 
 
boolean isLeft, isRight, isUp, isDown; 
 
void setup() {
  size(1000, 700);
  background(0);
  
  player = new Protagonista(width/2, height/2);
 
}
 
void draw() {
 
  background(0);
  player.display();
}
