
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Cell {
  int r;
  int g;
  int b;
  boolean state;
  boolean previous;
  color c;
  

  Cell(int r, int g, int b) {
    this.r = r;
    this.b = b;
    this.g = g;
    this.c = color(r, g, b);
    this.setState();
    this.previous = state;
  }
  
  boolean getPrevious(){
    return this.previous;
  }
  
  boolean getState(){
    return this.state;
  }
  color getColorRGB(){
    return this.c;
  }
  void setColorRGB(int r, int g, int b){
    this.c = color(r, g, b);
  }
  
  int sumaColores(){
    int suma = this.r + this.g + this.b;
    return suma;
  }

  
  void setState(){
    int min = 500;
    if(this.sumaColores() >= min){
      this.state = true;
    }else{
      this.state = false;
    }
  }
  
   void savePrevious() {
    previous = state; 
  }
  
  void newState(boolean newS){
    this.state = newS;
  }
  
  boolean alive(){
    return (this.sumaColores() <= 2295 && this.sumaColores() >= 1000);
  }
  
  void randomUp(){
    float number = random(3);
    int num = int(number);
    float wins = random(5);
    int newColor = this.getColorRGB();
    int newRandomColor = newColor + int(wins);
    if(num == 3){
      if(!(newRandomColor > 255)){
        this.setColorRGB(this.r, this.b, newRandomColor);
      }
    }
    else if(num == 2){
      if(!(newRandomColor > 255)){
        this.setColorRGB(this.r, newRandomColor, this.b);
      }
    }
    else if(num == 1){
      if(!(newRandomColor > 255)){
        this.setColorRGB(newRandomColor, this.g, this.b);
      }
    }
  }
    
   void randomDown(){
    float number = random(3);
    int num = int(number);
    float loses = random (1);
    int newColor = this.getColorRGB();
    int newRandomColor = newColor - int(loses);
    if(num == 3){
      if(!(newRandomColor > 255 && newRandomColor < 0)){
        this.setColorRGB(this.r, this.g, newRandomColor);
      }else{
        this.setColorRGB(int(random(255)), int(random(255)), int(random(255)));
      }
    }
    else if(num == 2){
      if(!(newRandomColor > 255 && newRandomColor < 0)){
        this.setColorRGB(this.r, newRandomColor, this.b);
      }else{
        this.setColorRGB(int(random(255)), int(random(255)), int(random(255)));
    }
    }
    else if(num == 1){
      if(!(newRandomColor > 255 && newRandomColor < 0)){
        this.setColorRGB(newRandomColor, this.g, this.b);
      }else{
        this.setColorRGB(int(random(255)), int(random(255)), int(random(255)));
      }
    }
  }
  
  
}
