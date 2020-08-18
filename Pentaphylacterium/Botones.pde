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
  rectMode(CORNER);
    if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) 
      mouse = true;
    else
      mouse = false;

    if (mouse) {
      stroke(0);
      strokeWeight(2);
      fill(#146428);
      rect(x, y, 1.5*resizeX(w), 2*resizeY(h));
      fill(255);
      textSize(resizeX(50));
      textAlign(CENTER, CENTER);
      text(texto, x + w/2, y + h/2);
    } else {
      stroke(0);
      strokeWeight(2);
      fill(#3C6450);
      rect(x, y, 1.5*resizeX(w), 2*resizeY(h));
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
