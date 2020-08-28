class Enemigo {
  float ipx, ipy;
  float px, py, w =80, h=96, vel;
  int x ;
  int y ;
  boolean activo;
  PImage enemigo = loadImage("Enemigo01.png");

  //Constructor
  Enemigo(int _x, int _y, int _vel) {
    ipx = _x;
    ipy = _y;
    px = _x;
    py = _y;
    vel = _vel;
    
  }

  //Método para dibujar
  void dibujar() {
    PVector direction = getDireccion(niveles[numNivel].player.getpx(), niveles[numNivel].player.getpy(), px, py, vel);
    noStroke();
    
   
    px += direction.x;
    py += direction.y;
    x= int(px);
    y= int(py);
    if(abs(direction.x)>=abs(direction.y)){
            
      if(direction.x>=0){
        
        copy(enemigo,80*((frameCount/2)%4),96*2,80,96,int(px),int(py),80,96);
        //sprite a la derecha
        
      }
      else {
        copy(enemigo,80*((frameCount/2)%4),96*1,80,96,int(px),int(py),80,96);
        
       //sprite a la izquierda 
      }            
       
    }
    
    
   else{
     
     if(direction.y>0){
       copy(enemigo,80*((frameCount/2)%4),0,80,96,int(px),int(py),80,96);
        //sprite a abajo
        
      }
      else {
        copy(enemigo,80*((frameCount/2)%4),96*3,80,96,int(px),int(py),80,96);
       //sprite a la arriba
      }          
     
     
     
   }
    
    
   
  
    
  }

  boolean getColision(float x, float y, float W, float H) {
    if (x + W/2 > px && x - W/2 < px + w && y + H/2 > py && y - H/2 < py + h)
      return true;
    else
      return false;
  }

  boolean getActivo() {
    return activo;
  }

  float getpx() {
    return px;
  }

  float getpy() {
    return py;
  }

  float getw() {
    return w;
  }

  float geth() {
    return h;
  }

  /*float getnumEne() {
    return numEnemigos;
  }*/
} 
