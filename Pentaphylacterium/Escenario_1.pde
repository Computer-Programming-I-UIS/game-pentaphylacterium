class Escenario {
  //Atributos
  PImage tileset = loadImage("nivel 1.png");
  int cols;
  int rows;
  char[][] escenario;  //Aquí se almacena la información del escenario
  char[][] objetos;  //Aquí se almacena la información de los objetos con los que interacciona
  char[][] objeto;  //Aquí se almacena la información de los objetos con los que no interacciona
  String filename;
  String objects;
  String object;
  
  
  
  //Constructor
  Escenario(int _cols, int _rows, String _filename, String _objects, String _object) {
    cols = _cols;
    rows = _rows;
    escenario = new char[cols][rows];
    objetos = new char[cols][rows];
    objeto = new char[cols][rows];
    filename = _filename;
    objects = _objects;
    object = _object;
  }
  
  //Métodos
  void obtenerDatos() {
    //leer el archivo del escenario
    String[] lines = loadStrings(filename);
    println("there are " + lines.length + " lines");
    for (int i = 0 ; i < lines.length; i++) {
      println(lines[i]);
      for(int j = 0 ; j < 44; j++) {
        escenario[j][i] = lines[i].charAt(j);
      }
    }
    
    println("Esta es la matriz de la información:");
    for (int i = 0 ; i < lines.length; i++) {
      for(int j = 0 ; j < 44; j++) {
        print(escenario[j][i]);
      }
      println("");
    }
    
    
  }
  
  
  void crearEscenario() {
    for (int i = 0 ; i < rows; i++) {
      for(int j = 0 ; j < cols; j++) {
        if(escenario[j][i] == 'M'){
          copy(tileset,0,0,30,30,(j*30),(i*30),30,30);
        }
      }
    }
  }
  
  void datosobjetos() {
    //leer el archivo de los objetos con los que interacciona
    String[] line = loadStrings(objects);
    println("there are " + line.length + " lines");
    for (int n = 0 ; n < line.length; n++) {
      println(line[n]);
      for(int m = 0 ; m < 44; m++) {
        objetos[m][n] = line[n].charAt(m);
      }
    }
    
    println("Esta es la matriz de la información:");
    for (int n = 0 ; n < line.length; n++) {
      for(int m = 0 ; m < 44; m++) {
        print(objetos[m][n]);
      }
      println("");
    }
  
  }
  
  void objetos() { // imprime los objetos con los que interacciona
    for (int n = 0 ; n < rows; n++) {
      for(int m = 0 ; m < cols; m++) {
        if(objetos[m][n] == 'E'){ // imprime los hongos
          copy(tileset,30,60,30,30,(m*30),(n*30),30,30);
        }
        if(objetos[m][n] == 'C'){ // imprime los cristales
          copy(tileset,60,30,30,30,(m*30),(n*30),30,30);
        }
      }
    }
    
  }
  
    void datosobjeto() {
    //leer el archivo de los objetos con los que no interacciona
    String[] liner = loadStrings(object);
    println("there are " + liner.length + " lines");
    for (int k = 0 ; k < liner.length; k++) {
      println(liner[k]);
      for(int l = 0 ; l < 44; l++) {
        objeto[l][k] = liner[k].charAt(l);
      }
    }
    
    println("Esta es la matriz de la información:");
    for (int k = 0 ; k < liner.length; k++) {
      for(int l = 0 ; l < 44; l++) {
        print(objeto[l][k]);
      }
      println("");
    }
  
  }
  
   void objeto() { // imprime los objetos con los que no interacciona
    for (int k = 0 ; k < rows; k++) {
      for(int m = 0 ; m < cols; m++) {
        if(objeto[m][k] == 'P'){ // imprime las piedritas
          copy(tileset,30,0,30,30,(m*30),(k*30),30,30);
        }
      }
    }
    
  }
  
}
