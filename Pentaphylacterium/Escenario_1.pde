class Escenario {
  //Atributos
  PImage tileset = loadImage("nivel 1.png");
  int cols;
  int rows;
  char[][] escenario;  //Aquí se almacena la información del escenario
  char[][] objetos;  //Aquí se almacena la información de los objetos
  String filename;
  String object;
  
  
  //Constructor
  Escenario(int _cols, int _rows, String _filename, String _object) {
    cols = _cols;
    rows = _rows;
    escenario = new char[cols][rows];
    objetos = new char[cols][rows];
    filename = _filename;
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
    //leer el archivo de los objetos
    String[] line = loadStrings(object);
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
  
  void objetos() {
    for (int n = 0 ; n < rows; n++) {
      for(int m = 0 ; m < cols; m++) {
        if(objetos[m][n] == 'P'){ // imprime las piedritas
          copy(tileset,30,30,30,30,(m*30),(n*30),30,30);
        }
        if(objetos[m][n] == 'E'){ // imprime los esqueletos
          copy(tileset,30,90,30,30,(m*30),(n*30),30,30);
        }
        if(objetos[m][n] == 'C'){ // imprime los cristales
          copy(tileset,60,30,30,30,(m*30),(n*30),30,30);
        }
      }
    }
    
  }
  
}
