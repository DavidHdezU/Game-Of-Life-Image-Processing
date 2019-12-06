/** 
* Clase que modela una celula similar a una del Juego de la Vida
* @author David Hernandez Uriostegui
* @version 1.0
* 05/12/2019
*/
class Cell {
  int r;
  int g;
  int b;
  boolean state;
  boolean previous;
  color c;
  /*
  * @param r - color rojo de la celula
  * @param g - color verde de la celula
  * @param b - color azul de la celula
  * @param state - estado actual de la celula
  * @param previous - estado pasado de la celula
  * @param c - color rgb de la celula
  */

  /* Constructor de la clase Cell
  * @param r - color rojo
  * @param g - color verde
  * @param b - color azul
  */
  Cell(int r, int g, int b) {
    this.r = r;
    this.b = b;
    this.g = g;
    this.c = color(r, g, b);
    this.setState();
    this.previous = state;
  }
  
  /* Getter de color color
  * return int - la cantidad de color rojo de la celula
  */
  int getRed(){
    return this.r;
  }

  /* Getter de color verde
  * return int - la cantidad de color verde de la celula
  */
  int getGreen(){
    return this.g;
  }

  /* Getter de color azul
  * return int - la cantidad de color azul de la celula
  */
  int getBlue(){
    return this.b;
  }
  
  /* Getter del estado previo
  * return boolean - el estado previo de una celula
  */
  boolean getPrevious(){
    return this.previous;
  }
  
  /* Getter del estado previo
  * return boolean - el estado de una celula
  */
  boolean getState(){
    return this.state;
  }

  /* Getter del color rgb de una celula}
  * return color - el color rgb de una celula
  */
  color getColorRGB(){
    return this.c;
  }

  /* Setter del color de una celula */
  void setColorRGB(int r, int g, int b){
    this.c = color(r, g, b);
  }
  
  /* Metodo que suma la cantidad dew colores rojo, verde y azul de una celula
  * return int - suma de los colores
  */
  int sumaColores(){
    int suma = this.r + this.g + this.b;
    return suma;
  }

  /* Setter del estado de una celula */
  void setState(){
    int min = 500;
    if(this.sumaColores() >= min){
      this.state = true;
    }else{
      this.state = false;
    }
  }
  
  /* Meto que salva el estado previo de una celula */
   void savePrevious() {
    previous = state; 
  }
  
  /* Metodo que asigna un nuevo estado */
  void newState(boolean newS){
    this.state = newS;
  }
  
  /* Metodo que aumenta el valor de un canal del color rgb aleatoriamente */
  void randomUp(){
    float number = random(3);
    int num = int(number);
    float wins = random(255);
    int newColor = this.getColorRGB();
    int newRandomColor = newColor + int(wins);
    int newRandomGreen = this.getGreen() + int(wins);
    int newRandomBlue = this.getBlue() + int(wins);
    int newRandomRed = this.getRed() + int(wins);
    if(num == 3){
      if(!(newRandomBlue > 255)){
        this.setColorRGB(this.r, this.g, newRandomBlue);
      }
    }
    else if(num == 2){
      if(!(newRandomGreen > 255)){
        this.setColorRGB(this.r, newRandomGreen, this.b);
      }
    }
    else if(num == 1){
      if(!(newRandomRed > 255)){
        this.setColorRGB(newRandomRed, this.g, this.b);
      }
    }
  }
    
  /* Metodo que disminuye el valor de un canal del color rgb aleatoriamente */
   void randomDown(){
    float number = random(3);
    int num = int(number);
    float loses = random (255);
    int newColor = this.getColorRGB();
    int newRandomColor = newColor - int(loses);
    int newRandomGreen = this.getGreen() - int(loses);
    int newRandomBlue = this.getBlue() - int(loses);
    int newRandomRed = this.getRed() - int(loses);
    if(num == 3){
      if(!(newRandomBlue > 255 || newRandomBlue < 0)){
        this.setColorRGB(this.r, this.g, newRandomBlue);
      }
    }
    else if(num == 2){
      if(!(newRandomGreen > 255 || newRandomGreen < 0)){
        this.setColorRGB(this.r, newRandomGreen, this.b);
      }
    }
    else if(num == 1){
      if(!(newRandomRed > 255 || newRandomRed < 0)){
        this.setColorRGB(newRandomRed, this.g, this.b);
      }
    }
  }
  
  
}
