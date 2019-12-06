/** 
* Clase main donde se corre el sketch
* @author David Hernandez Uriostegui
* @version 1.0
* 05/12/2019
*/

PImage img;
Board board;
Board board2;
String loc2;

/* Metodo que establecen los configuraciones para que el skecth funcione */
void setup() {  
  loc2 = "images_for_debug/tree3.jpg";
  size(1500, 1000);
  frameRate(1);
  try{
    noDirectory(loc2);
  }catch(NoImage e){
    System.out.println(e.getMessage() + ", abriendo otra imagen por defecto");
    loc2 = "images_for_debug/tunel1.jpg";
  }
  try{
    ilegalF(loc2);
  }catch(InvalidFormat e){
    System.out.println(e.getMessage() + ", abriendo otra imagen por defecto");
    loc2 = "images_for_debug/tunel1.jpg";
  }
  img = loadImage(loc2);
  try{
    board = new Board(img.width, img.height);
    smallSize(board);
  }catch(SizeException e){
    System.out.println(e.getMessage() + ", abriendo otra imagen por defecto");
    img = loadImage("images_for_debug/tunel1.jpg");
    board = new Board(img.width, img.height);
  }
  loadPixels();
  img.loadPixels();
    for(int i = 0; i < img.width; i++){
      for(int j = 0; j < img.height; j++){
        int loc = i+j*img.width;
        int r = int(red(img.pixels[loc]));
        int g = int(green(img.pixels[loc]));
        int b = int(blue(img.pixels[loc]));
        Cell c = new Cell(r, g, b);
        board.setNewCell(i, j, c);
      }
    }
    board2 = board;
}

/* Metodo que dibuja todos los metodos que se requieren para hacer funcional el programa */
void draw() {  
  img.loadPixels();
  image(img, 0, 0);
  for(int i = 0; i < img.width; i++){
    for(int j = 0; j < img.height; j++){
      Cell c2 = board2.getCell(i, j);
      int loc = i + j*img.width;
      color c = c2.getColorRGB();
      img.pixels[loc] = c;    
    }
  }
  img.updatePixels();
  displayRules();
  button();
  button2();
  button3();
}



/* Metodo que indica las reglas que deben seguir las celulas dentro de la imagen */
void displayRules(){
  for(int i = 0; i < img.width ; i++){
    for(int j = 0; j < img.height; j++){
      Cell all = board.getCell(i, j);
      if(all.getState() == true){
        if(board.sumaColorV() < 1000 || board.sumaColorV() > 2295){
          do{
            all.randomDown();
          }while(all.sumaColores() < 500);
        }else{
          all.randomUp();
        }
      }  
      else if(all.getState() == false){
        if(board.sumaColorV() >= 500 && board.sumaColorV() <= 755){
          do{
            all.randomUp();
          }while(all.sumaColores() >= 500);
        }else{
          all.randomDown();
        }
      }
    }
  }
}
/* Metodo que indica que se ingreso una iamgen con formato invalido jpg */
void ilegalF(String location) throws InvalidFormat{
  String jpg = ".jpg";
  String png = ".png";
  String jpeg = ".jpeg";
  boolean resPNG = location.contains(png);
  boolean resJPG = location.contains(jpg);
  boolean resJPEG = location.contains(jpeg);
  if(resPNG == true || resJPG == true || resJPEG == true){ 
    img = loadImage(location);
  }else{
    throw new InvalidFormat("Formato Inavlido");
  }
}
/* Metodo que indica que la imagen que se ingreso es menor a 500 x 500 pixeles */
void smallSize(Board board) throws SizeException{
  if((board.getAlto() < 500) || (board.getAncho() < 500)){
    throw new SizeException("El tamaño de la imagen debe de ser de 500 x 500 pixeles :(");
  }
}

/* Metodo que indica que la imagen no es encuentra en el directorio */
void noDirectory(String s) throws NoImage{
  String s2 = "images_for_debug/";
  boolean direc = s.contains(s2);
  if(direc == false) throw new NoImage("La imagen ingresada no se encontró en el directorio");
  
}
/* Metodo que indica que no hay una imagen cargada */
void noImage() throws NoImage{
  if(loc2 == null){
    throw new NoImage("No hay una imagen cargada");
  }else{
    button();
  }
}

/* Metodo que agrega un boton para guardar la imagen */
void button(){
  float x = 1250;
  float y = 40;
  float w = 75;
  float h = 75;
  String s = "SAVE IMAGE";
  textSize(12);
  fill(255, 123, 33);
  rect(x,y,w,h);
  fill(0);
  text(s, 1252, 76);
    if((mouseX > x) && (mouseX < x+w) && (mouseY > y) && (mouseY < y+h)){
      img.save("images_for_debug/resultado.jpg");
      System.out.println("La foto se ha guardado en 'images_for_debug' como 'resultado.jpg' :D");
    }
  
}
/* Metodo que agrega un boton para pausar el programa */
void button2(){
  float x = 1250;
  float y = 500;
  float w = 95;
  float h = 75;
  String s = "PAUSE SKETCH";
  textSize(12);
  fill(255, 0, 145);
  rect(x,y,w,h);
  fill(0);
  text(s, 1252, 566);
  if(mousePressed){
    if(mouseX >=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h){
      if (looping){  
        noLoop();
        System.out.println("Se ha pausado el Sketch :0");
      }
    }
  }
}
/* Metodo que agrega un boton para pausar el programa */
void button3(){
  float x = 1250;
  float y = 250;
  float w = 95;
  float h = 75;
  String s = "RESUME SKETCH";
  textSize(12);
  fill(0, 123, 33);
  rect(x,y,w,h);
  fill(0);
  text(s, 1252, 316);
  if(mousePressed){
    if(mouseX >=x && mouseX <=x+w && mouseY>=y && mouseY <=y+h){
      if (!(looping)){  
        loop();
        System.out.println("Se ha reanudado el Sketch :0");
      }
    }
  }
}



/* Metodo que guarda la imagen en el momento que se da click */
 void mousePressed() {
   try{
     button2();
     button3();
     noImage();
   }catch(NoImage e){
     System.out.println(e.getMessage() + ", por favor introduce una imagen, guardando fondo negro");
   }
}  
