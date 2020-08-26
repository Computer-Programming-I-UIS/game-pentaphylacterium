import processing.sound.*;        //Librería de sonido de Processing.

  //Llama a todos los objetos de la clase SoundFile.
SoundFile nivel1;
SoundFile nivelCompletado;
SoundFile s_recoger;

  //Llama a todos los objetos de la clase PImage
PImage inicio;
PImage instrucciones;

  //Método para crear los botones.
void crearBotones(){
  botones = new Boton[14];
  botones[0] = new Boton(width-resizeX(1200), resizeY(320), resizeX(350), resizeY(100), "Nueva Partida");
  botones[1] = new Boton(width-resizeX(1200), resizeY(470), resizeX(350), resizeY(100), "Niveles");
  botones[2] = new Boton(width-resizeX(1200), resizeY(620), resizeX(350), resizeY(100), "Instrucciones");
  botones[3] = new Boton(width-resizeX(300), height - resizeY(100), resizeX(250), resizeY(80), "Créditos");
  botones[4] = new Boton(width-resizeX(1200), resizeY(770), resizeX(350), resizeY(100), "Salir");
  botones[5] = new Boton(resizeX(100), height - resizeY(150), resizeX(250), resizeY(80), "Atrás");

  botones[6] = new Boton(resizeX(200), resizeY(300), resizeX(250), resizeY(80), "Nivel 1");
  botones[7] = new Boton(resizeX(200), resizeY(400), resizeX(250), resizeY(80), "Nivel 2");
  botones[8] = new Boton(resizeX(200), resizeY(500), resizeX(250), resizeY(80), "Nivel 3");
  botones[9] = new Boton(resizeX(200), resizeY(600), resizeX(250), resizeY(80), "Nivel 4");
  botones[10] = new Boton(resizeX(200), resizeY(700), resizeX(250), resizeY(80), "Nivel 5");
  botones[11] = new Boton(resizeX(40), height - resizeY(100), resizeX(60), resizeY(60), "II");
  
  botones[12] = new Boton(width-resizeX(500), resizeY(650), resizeX(350), resizeY(100), "Siguiente Nivel");
  botones[13] = new Boton(width-resizeX(500), resizeY(850), resizeX(350), resizeY(100), "Menu Principal");
}

  //Método para cargar los audios
void cargarAudio() {
  nivel1 = new SoundFile(this, "hunters.mp3");
  nivelCompletado = new SoundFile(this, "win.mp3");
  
  s_recoger = new SoundFile(this, "pick.mp3");
}
void cargarImagenes() {
  inicio = loadImage("Inicio.png");
  instrucciones = loadImage("Instructivo.png");
}
  //Método para controlar la música
void musicSystem() {
  if (!nivel1.isPlaying() && numVentana == 0) {
    nivel1.stop();
    nivel1.play();
  }
}

  //Método de creación de niveles.
void crearNiveles() {
  niveles = new Nivel[5];
  niveles[0] = new Nivel();
  niveles[1] = new Nivel();
  niveles[2] = new Nivel();
  niveles[3] = new Nivel();
  niveles[4] = new Nivel();
}

void menu() {
  botones[0].dibujar();
  if(botones[0].click()){
    numNivel = 0;
    numVentana = 4;
  }
  botones[1].dibujar();
  if(botones[1].click()){
    numVentana = 1;
  }
  botones[2].dibujar();
  if(botones[2].click()){
    numVentana = 2;
  }
  botones[3].dibujar();
  if(botones[3].click()){
    numVentana = 3;
  }
  botones[4].dibujar();
  if(botones[4].click()){
    exit();
  }
}

void niveles() {
  botones[5].dibujar();
  if(botones[5].click()){
    numVentana = 0;
  }
  botones[6].dibujar();
  if(botones[6].click()){
    numNivel = 0;
    numVentana = 4;
  }
  botones[7].dibujar();
  if(botones[7].click()){
    numNivel = 1;
    numVentana = 4;
  }
  botones[8].dibujar();
  if(botones[8].click()){
    numNivel = 2;
    numVentana = 4;
  }
  botones[9].dibujar();
  if(botones[9].click()){
    numNivel = 3;
    numVentana = 4;
  }
  botones[10].dibujar();
  if(botones[10].click()){
    numNivel = 4;
    numVentana = 4;
  }
}

void opciones(){
  botones[5].dibujar();
  if(botones[5].click()){
    numVentana = 0;
  }
}

void creditos(){
  botones[5].dibujar();
  if(botones[5].click()){
    numVentana = 0;
  }
}

void nivelCompletado() {
  if(numNivel < 5){
    botones[13].dibujar();
    if(botones[13].click()) {
      numVentana = 0;
    }
    
    botones[12].dibujar();
    if(botones[12].click()) {
      numNivel++;
      numVentana = 4;
    }
  }
}

void juegoTerminado() {
    menu();
    numVentana = 0;
    /*botones[13].dibujar();
    if(botones[13].click()) {
      numVentana = 0;
    }*/
}
