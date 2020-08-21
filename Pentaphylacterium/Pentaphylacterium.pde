/****************************************************************************************
                                PENTAPHYLACTERIUM

Autores:
  *Santiago Gutierrez Valderrama.
  *Luis Fernando Romero Rojas.
Descripción:

Asignatura: Programación de Computadores I.
Grupo: D2.
Universidad Industrial de Santanader.
****************************************************************************************/

static Nivel[] niveles;
static int numNivel = 0;
static int numVentana = 0;
//Bloque obstaculo;
Boton[] botones;

Escenario nivel;
PImage inicio;
 
void setup() {
  size(1320, 600);
  crearBotones();
  crearNiveles();    //funciones que están en la pestaña Ventanas
  nivel = new Escenario(44,20,"Nivel1.txt", "objtsNivel1.txt", "objtNivel1.txt");
  inicio = loadImage("Inicio.png");
}

void draw() {
  background(#1E643C);
  
  switch(numVentana){   //sirve para hacer el cambio entre ventanas
    case 0:
      image(inicio, 0, 0);
      menu();
      break;
    case 1:
      niveles();
      break;
    case 2:
      opciones();
      break;
    case 3:
      creditos();
      break;
    case 4:
      nivel.obtenerDatos();
      nivel.crearEscenario();
      nivel.datosobjeto();
      nivel.objeto();
      nivel.datosobjetos();
      nivel.objetos();
      niveles[numNivel].jugar();
      creditos();
      break;
  }
  
  oneClick();   //función para dar click solo una vez
}

static boolean[] keys = new boolean[7];   //variable para las teclas a usar

void keyPressed() {

  if(key == 'w')
    keys[0] = true;
  if(key == 'd')  
    keys[1] = true;
  if(key == 's')
    keys[2] = true;
  if(key == 'a')  
    keys[3] = true;
  if(key == 'e')  
    keys[6] = true;
}

void keyReleased() {
  if(key == 'w')
    keys[0] = false;
  if(key == 'd')
    keys[1] = false;
  if(key == 's')
    keys[2] = false;
  if(key == 'a')  
    keys[3] = false;
  if(key == 'e')  
    keys[6] = false;
}

void mousePressed() {
  if(mouseButton == LEFT)
    keys[4] = true;
  if(mouseButton == RIGHT)
    keys[5] = true;
}

void oneClick(){
  if(keys[4])
    keys[4] = false;
  if(keys[5])
    keys[5] = false;
}

PVector getDireccion(float x1, float y1, float x2, float y2, float v) {
  PVector vec1 = new PVector(x1, y1);
  PVector vec2 = new PVector(x2, y2);
  PVector dir = new PVector();

  dir.set(PVector.sub(vec1, vec2));
  dir.normalize();
  dir.mult(resizeX(v));

  return dir;
}

float resizeX(float value) {              //función para hacer el resize en X
  float newValue = (width*value)/1920;
  return newValue;
}

float resizeY(float value) {              //función para hacer el resize en Y
  float newValue = (height*value)/1080;
  return newValue;
}
