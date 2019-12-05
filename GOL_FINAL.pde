
PImage pika;
Board board;
Board board2;
String loc2;

void setup() {  
  loc2 = "images_for_debug/bird.jpg";
  size(1920, 1020);
  frameRate(1);
  try{
    ilegalF(loc2);
  }catch(InvalidFormat e){
    System.out.println(e.getMessage() + ", abriendo otra imagen por defecto");
    loc2 = "images_for_debug/tunel1.jpg";
  }
  pika = loadImage(loc2);
  try{
    board = new Board(pika.width, pika.height);
    smallSize(board);
  }catch(SizeException e){
    System.out.println(e.getMessage() + ", abriendo otra imagen por defecto");
    pika = loadImage("images_for_debug/sao2.jpg");
    board = new Board(pika.width, pika.height);
  }
  loadPixels();
  pika.loadPixels();
    for(int i = 0; i < pika.width; i++){
      for(int j = 0; j < pika.height; j++){
        int loc = i+j*pika.width;
        int r = int(red(pika.pixels[loc]));
        int g = int(green(pika.pixels[loc]));
        int b = int(blue(pika.pixels[loc]));
        Cell c = new Cell(r, g, b);
        board.setNewCell(i, j, c);
      }
    }
    board2 = board;
}

void draw() {  
  pika.loadPixels();
  image(pika, 0, 0);
  for(int i = 0; i < pika.width; i++){
    for(int j = 0; j < pika.height; j++){
      Cell c2 = board2.getCell(i, j);
      int loc = i + j*pika.width;
      color c = c2.getColorRGB();
      pika.pixels[loc] = c;    
    }
  }
  pika.updatePixels();
  displayRules();
}



    
void displayRules(){
  for(int i = 0; i < pika.width ; i++){
    for(int j = 0; j < pika.height; j++){
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

void ilegalF(String location) throws InvalidFormat{
  String jpg = ".jpg";
  boolean resJPG = location.contains(jpg);
  if(resJPG == false) throw new InvalidFormat("Formato jpg Inavlido");
}
void ilegalF2(String location) throws InvalidFormat{
  String png = ".png";
  boolean resPNG = location.contains(png);
  if(resPNG == false) throw new InvalidFormat("Formato png Inavlido");
}
void ilegalF3(String location) throws InvalidFormat{
  String jpeg = ".jpeg";
  boolean resJPEG = location.contains(jpeg);
  if(resJPEG == false) throw new InvalidFormat("Formato jpeg Inavlido");
}
void smallSize(Board board) throws SizeException{
  if((board.getAlto() < 500) || (board.getAncho() < 500)){
    throw new SizeException("El tamaño de la imagen debe de ser de 500 x 500 pixeles :(");
  }
}




 void mousePressed() {
  save("images_for_debug/arco2.jpg");
  System.out.println("Ya se guardó la imagen");
}  
