/****************************************************
Autores:
  *Santiago Gutierrez Valderrama
  *Luis Fernando Romero Rojas

Descripción:
  

Características:
  
****************************************************/

Protagonista player;
static int numNivel = 0;
static int numVentana = 0;
//Bloque obstaculo;
Boton[] botones;
boolean isLeft, isRight, isUp, isDown; 
 
void setup() {
  size(1325, 600);
  crearBotones();
  player = new Protagonista(width/2, height/2);
 
}
 
void draw() {
  background(#1E643C);
  
  switch(numVentana){
    case 0:
      menu();
      break;
    case 1:
      nivel();
      break;
    case 2:
      opciones();
      break;
    case 3:
      ayuda();
      break;
    case 4:
      //Jugar;
      player.mover();
      player.display();
      ayuda();
      break;
  }
  
  oneClick();
 
 
}

static boolean[] keys = new boolean[7];

void mousePressed() {
  if(mouseButton == LEFT)
    keys[4] = true;
  if(mouseButton == RIGHT)
    keys[4] = true;
}

void oneClick(){
  if(keys[4])
    keys[4] = false;
    
  if(keys[5])
    keys[5] = false;
}

float resizeX(float value) {
  float newValue = (width*value)/1920;
  return newValue;
}

float resizeY(float value) {
  float newValue = (height*value)/1080;
  return newValue;
}
