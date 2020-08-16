class Boton {
  float x, y;
  int w, h;
  String texto; 
  boolean mouse;
  
  
  Boton (float _x, float _y, float _w, float _h, String _t){
    x = _x;
    y = _y;
    w = round(_w);
    h = round(_h);
    texto = _t;
  }
  
void dibujar() {
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) 
      mouse = true;
    else
      mouse = false;

    if (mouse) {
      fill(255);
      textSize(resizeX(50));
      textAlign(CENTER, CENTER);
      text(texto, x + w/2, y + h/2);
    } else {
      fill(0);
      textSize(resizeX(50));
      textAlign(CENTER, CENTER);
      text(texto, x + w/2, y + h/2);
    }
  }
  
  boolean mouse(){
    if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h){
      return true;
    }else{
      return false;
    }
  }
  
  boolean click() {
    if(mouse && keys[4]){
      return true;
    }else{
      return false;
    }
  }
}
