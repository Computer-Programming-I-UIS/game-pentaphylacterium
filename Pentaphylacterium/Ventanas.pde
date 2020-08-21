void crearBotones(){
  botones = new Boton[11];
  botones[0] = new Boton(width-resizeX(1200), resizeY(320), resizeX(350), resizeY(100), "Nueva Partida");
  botones[1] = new Boton(width-resizeX(1200), resizeY(470), resizeX(350), resizeY(100), "Niveles");
  botones[2] = new Boton(width-resizeX(1200), resizeY(620), resizeX(350), resizeY(100), "Opciones");
  botones[3] = new Boton(width-resizeX(1200), resizeY(770), resizeX(350), resizeY(100), "Ayuda");
  botones[4] = new Boton(width-resizeX(1200), resizeY(920), resizeX(350), resizeY(100), "Salir");
  botones[5] = new Boton(resizeX(200), height - resizeY(250), resizeX(350), resizeY(100), "Atras");

  botones[6] = new Boton(resizeX(200), resizeY(300), resizeX(250), resizeY(80), "Nivel 1");
  botones[7] = new Boton(resizeX(200), resizeY(400), resizeX(250), resizeY(80), "Nivel 2");
  botones[8] = new Boton(resizeX(200), resizeY(500), resizeX(250), resizeY(80), "Nivel 3");
  botones[9] = new Boton(resizeX(200), resizeY(600), resizeX(250), resizeY(80), "Nivel 4");
  botones[10] = new Boton(resizeX(200), resizeY(700), resizeX(250), resizeY(80), "Nivel 5");
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
  fill(255);
  textSize(36);
  strokeWeight(8);
  stroke(#0028FC);
  text("w", width/16 +11, height/2 -40);
  text("s", width/16 +9, height/2 +20);
  line(width/16 +10, height/2 -80, width/16 +10, height/2 -120);
  line(width/16, height/2 -100, width/16 +10, height/2 -120);
  line(width/16 +20, height/2 -100, width/16 +10, height/2 -120);
  line(width/16 +10, height/2 +60, width/16 +10, height/2 +100);
  line(width/16, height/2 +80, width/16 +10, height/2 +100);
  line(width/16 +20, height/2 +80, width/16 +10, height/2 +100);
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
