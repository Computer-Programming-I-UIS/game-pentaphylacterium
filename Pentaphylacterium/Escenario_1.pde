class Escenario {
  //Atributos
  int cols;
  int rows;
  char[][] escenario;  //Aquí se almacena la información del escenario
  String filename;
  
  
  //Constructor
  Escenario(int _cols, int _rows, String _filename) {
    cols = _cols;
    rows = _rows;
    escenario = new char[cols][rows];
    filename = _filename;
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
          fill(0,200,0);
          rect(j*30,i*30,30,30);
        }
      }
    }
  }
  
  
  
}
