import processing.sound.*;        //Librería de sonido de Processing.

//Llama a todos los objetos de la clase SoundFile.
SoundFile nivel1;
SoundFile nivelCompletado;
SoundFile s_recoger;
SoundFile s_click;
SoundFile intro;
SoundFile die;
int y=610;

//Llama a todos los objetos de la clase PImage
PImage inicio;
PImage instrucciones;
PImage sprite;
PImage fondo;
PImage tileset;
PImage cambioNivel;
PImage menuNiveles;
PImage GameOver;

//Método para crear los botones.
void crearBotones() {
  botones = new Boton[16];
  botones[0] = new Boton(width-resizeX(1200), resizeY(320), resizeX(350), resizeY(100), "Nueva Partida");
  botones[1] = new Boton(width-resizeX(1200), resizeY(470), resizeX(350), resizeY(100), "Niveles");
  botones[2] = new Boton(width-resizeX(1200), resizeY(620), resizeX(350), resizeY(100), "Instrucciones");
  botones[3] = new Boton(width-resizeX(320), height - resizeY(120), resizeX(250), resizeY(80), "Créditos");
  botones[4] = new Boton(width-resizeX(1200), resizeY(770), resizeX(350), resizeY(100), "Salir");
  botones[5] = new Boton(resizeX(100), height - resizeY(150), resizeX(250), resizeY(80), "Atrás");

  botones[6] = new Boton(resizeX(200), resizeY(200), resizeX(250), resizeY(80), "Nivel 1");
  botones[7] = new Boton(resizeX(650), resizeY(200), resizeX(250), resizeY(80), "Nivel 2");
  botones[8] = new Boton(resizeX(200), resizeY(400), resizeX(250), resizeY(80), "Nivel 3");
  botones[9] = new Boton(resizeX(650), resizeY(400), resizeX(250), resizeY(80), "Nivel 4");
  botones[10] = new Boton(resizeX(400), resizeY(600), resizeX(250), resizeY(80), "Nivel 5");
  botones[11] = new Boton(resizeX(40), height - resizeY(100), resizeX(60), resizeY(60), "II");

  botones[12] = new Boton(width-resizeX(500), resizeY(650), resizeX(350), resizeY(100), "Siguiente Nivel");
  botones[13] = new Boton(width-resizeX(500), resizeY(850), resizeX(350), resizeY(100), "Menu Principal");
  botones[14] = new Boton(width-resizeX(500), resizeY(650), resizeX(350), resizeY(100), "Reintentar");
  botones[15] = new Boton(width-resizeX(500), resizeY(650), resizeX(350), resizeY(100), "Continuar");
}

//Método para cargar los audios
void cargarAudio() {
  nivel1 = new SoundFile(this, "hunters.mp3");
  nivelCompletado = new SoundFile(this, "win.mp3");
  intro = new SoundFile(this, "intro.mp3");
  die = new SoundFile(this, "die.mp3");

  s_recoger = new SoundFile(this, "pick.mp3");
  s_click = new SoundFile(this, "click.mp3");
}
void cargarImagenes() {
  sprite = loadImage("Protagonista.png");
  instrucciones = loadImage("Instructivo.png");
  inicio = loadImage("Menu.png");
  fondo = loadImage("Fondo.png");
  tileset = loadImage("Dungeon01.png");
  cambioNivel = loadImage("cambio.png");
  menuNiveles = loadImage("niveles.png");
  GameOver = loadImage("Gameover.png");
}
//Método para controlar la música
void musicSystem() {
  if (!intro.isPlaying() && numVentana == 0) {
    nivel1.stop();
    die.stop();
    intro.stop();
    intro.play();
  }

  if (!nivel1.isPlaying() && numVentana == 4) {
    intro.stop();
    nivel1.stop();
    nivel1.play();
  }
}

//Método de creación de niveles.
void crearNiveles() {
  niveles = new Nivel[5];
  niveles[0] = new Nivel(10);
  niveles[1] = new Nivel(15);
  niveles[2] = new Nivel(20);
  niveles[3] = new Nivel(25);
  niveles[4] = new Nivel(30);
}

void menu() {
  botones[0].dibujar();
  if (botones[0].click()) {
    s_click.play();
    numNivel = 0;
    numVentana = 4;
  }
  botones[1].dibujar();
  if (botones[1].click()) {
    s_click.play();
    numVentana = 1;
  }
  botones[2].dibujar();
  if (botones[2].click()) {
    s_click.play();
    numVentana = 2;
  }
  botones[3].dibujar();
  if (botones[3].click()) {
    s_click.play();
    numVentana = 3;
  }
  botones[4].dibujar();
  if (botones[4].click()) {
    exit();
  }
}

void niveles() {
  image(menuNiveles, 0, 0);
  botones[5].dibujar();
  if (botones[5].click()) {
    s_click.play();
    numVentana = 0;
  }
  botones[6].dibujar();
  if (botones[6].click()) {
    s_click.play();
    numNivel = 0;
    numVentana = 4;
  }
  botones[7].dibujar();
  if (botones[7].click()) {
    s_click.play();
    numNivel = 1;
    numVentana = 4;
  }
  botones[8].dibujar();
  if (botones[8].click()) {
    s_click.play();
    numNivel = 2;
    numVentana = 4;
  }
  botones[9].dibujar();
  if (botones[9].click()) {
    s_click.play();
    numNivel = 3;
    numVentana = 4;
  }
  botones[10].dibujar();
  if (botones[10].click()) {
    s_click.play();
    numNivel = 4;
    numVentana = 4;
  }
}

void opciones() {
  image(instrucciones, 0, 0);
  botones[5].dibujar();
  if (botones[5].click()) {
    s_click.play();
    numVentana = 0;
  }
}

void creditos() {
  textSize(32);
  text(" PENTAPHYLACTERIUM", 650, y);
  textSize(24);
  text(" DESARROLLO Y PRODUCCION", 650, y+60);
  text(" Luis Fernando Romero Rojas", 650, y+95);
  text(" Santiago Gutierrez Valderrama", 650, y+130);
  text(" COLABORACION MUSICAL", 650, y+190);
  text(" Camila Andrea Gómez Pérez. Estudiante de música UIS", 650, y+225);
  text(" APOYO E INSTRUCCION", 650, y+285);
  text(" Alex Julian Mantilla Rios. Estudiante de Ing. Electronica UIS", 650, y+320);
  text(" Camilo Eduardo Rojas Ortiz. Docente UIS", 650, y+355);

  y--;
  botones[5].dibujar();

  if (y+355<0) y=610;

  if (botones[5].click()) {
    s_click.play();
    numVentana = 0;
    y=610;
  }
}

void gameOver() {
  image(GameOver, 0, 0);
  botones[14].dibujar();
  if (botones[14].click()) {
    numVentana = 4;
  }
  botones[13].dibujar();
  if (botones[13].click()) {
    s_click.play();
    numVentana = 0;
  }
}

void nivelCompletado() {
  image(cambioNivel, 0, 0);
  botones[13].dibujar();
  if (botones[13].click()) {
    s_click.play();
    numVentana = 0;
  }

  botones[12].dibujar();
  if (botones[12].click()) {
    s_click.play();
    numNivel++;
    numVentana = 4;
  }
}

void juegoTerminado() {
  image(fondo, 0, 0);
  intro.stop();
  botones[13].dibujar();
  if (botones[13].click()) {
    numVentana = 0;
  }
}

void pausa() {
  image(fondo, 0, 0);
  botones[15].dibujar();
  if (botones[14].click()) {
    numVentana = 4;
  }
  botones[13].dibujar();
  if (botones[13].click()) {
    numVentana = 0;
  }
}
