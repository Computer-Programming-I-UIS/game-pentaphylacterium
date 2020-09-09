/************************************************************************************************
 PENTAPHYLACTERIUM
 
 Autores:
 *Santiago Gutierrez Valderrama.
 *Luis Fernando Romero Rojas.
 Colaboración: Camila Andrea Gómez Pérez. Estudiante de música UIS.
 
 Asignatura: Programación de Computadores I.
 Grupo: D2.
 Universidad Industrial de Santanader.
 
 Descripción: Ayuda al intrépido explorador a surcar las laberínticas y peligrosas mazmorras 
 llenas de espectros en búsqueda de los fragmentos perdidos del mítico talismán, 
 el legendario Pentaphylacterium codiciado por todos los cazatesoros.
 
 Para la ejecución de este programa es necesaria la instalación de la librería processing.sound.*
 ***********************************************************************************************/

static Nivel[] niveles;
static int numNivel = 0;
static int numVentana = 0;
Boton[] botones;

Escenario nivel;

void setup() {
  size(1320, 600);
  nivel = new Escenario(44, 20, 1);
  crearBotones();
  crearNiveles();  
  cargarImagenes();
  cargarAudio();    //funciones que están en la pestaña Ventanas
}

void draw() {
  background(#1E643C);

  switch(numVentana) {   //cambio entre ventanas
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
    image(mapa, 0, 0);
    creditos();
    break;
  case 4:
    nivel.cargarNivel();
    nivel.crearEscenario();
    nivel.objeto();
    nivel.objetos();
    niveles[numNivel].jugar(nivel.pos_interacciones, nivel.numElemInt);
    botones[11].dibujar();
    if (botones[11].click()) {
      numVentana = 8;
    }
    break;
  case 5:
    nivelCompletado1();
    break;
  case 6:
    juegoTerminado();
    break;
  case 7:
    gameOver();
    break;
  case 8:
    pausa();
    break;
  case 9:
    intro1();
    break;
  case 10:
    intro2();
    break;
  case 11:
    intro3();
    break;
  case 12:
    intro4();
    break;
  case 13:
    nivelCompletado2();
    break;
  case 14:
    nivelCompletado3();
    break;
  case 15:
    nivelCompletado4();
    break;
  case 16:
    intro5();
    break;
  case 17:
    intro6();
    break;
  }

  oneClick();   //función para dar click solo una vez

  musicSystem();  //activación del sonido
}

static boolean[] keys = new boolean[7];   //variable para las teclas a usar

void keyPressed() {

  if (key == 'w')
    keys[0] = true;
  if (key == 'd')  
    keys[1] = true;
  if (key == 's')
    keys[2] = true;
  if (key == 'a')  
    keys[3] = true;
  if (key == 'e')  
    keys[6] = true;
}

void keyReleased() {
  if (key == 'w')
    keys[0] = false;
  if (key == 'd')
    keys[1] = false;
  if (key == 's')
    keys[2] = false;
  if (key == 'a')  
    keys[3] = false;
  if (key == 'e')  
    keys[6] = false;
}

void mousePressed() {
  if (mouseButton == LEFT)
    keys[4] = true;
  if (mouseButton == RIGHT)
    keys[5] = true;
}

void oneClick() {
  if (keys[4])
    keys[4] = false;
  if (keys[5])
    keys[5] = false;
}

PVector getDireccion(float x1, float y1, float x2, float y2, float v) {  //funcion para obtener direccion
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
