PImage pika;
Cell[][] img;
Cell [][] img2;
PImage destination;
Board board;
Board board2;


void setup() {
  size(2000, 2000);
  frameRate(66666);
  pika = loadImage("images_for_debug/galaxy2.jpg");
  board = new Board(pika.width, pika.height);
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
  board2 = board.copia();
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




 

// reset board when mouse is pressed
void mousePressed() {
  draw();
}  
