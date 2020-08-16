void crearBotones(){
  botones = new Boton[6];
  botones[0] = new Boton(width-resizeX(500), resizeY(50), resizeX(400), resizeY(150), "Nueva Partida");
  botones[1] = new Boton(width-resizeX(500), resizeY(250), resizeX(400), resizeY(150), "Nivel");
  botones[2] = new Boton(width-resizeX(500), resizeY(450), resizeX(400), resizeY(150), "Opciones");
  botones[3] = new Boton(width-resizeX(500), resizeY(650), resizeX(400), resizeY(150), "Ayuda");
  botones[4] = new Boton(width-resizeX(500), resizeY(850), resizeX(400), resizeY(150), "Salir");
  botones[5] = new Boton(resizeX(200), height - resizeY(250), resizeX(650), resizeY(160), "Atras");
}

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

void nivel() {
  botones[5].dibujar();
  if(botones[5].click()){
    numVentana = 0;
  }
}

void opciones(){
  botones[5].dibujar();
  if(botones[5].click()){
    numVentana = 0;
  }
}

void ayuda(){
  botones[5].dibujar();
  if(botones[5].click()){
    numVentana = 0;
  }
}
