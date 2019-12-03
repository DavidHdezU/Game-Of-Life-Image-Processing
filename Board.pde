class Board{
  Cell[][] board;
  int alto;
  int ancho;
  
  int tamano = 700;
  
 Board(){
   this.board = new Cell[tamano][tamano];
 }
  Board(int i, int j){
    this.alto = i;
    this.ancho = j;
    this.board = new Cell[i][j];
  }
  
  int sumaVecinos(){
    int suma  = 0;
    return suma;
  }
  
  int sumaColorV(){
    int suma = 0;
    for(int i= -1; i < 2; i++){
      for(int j = -1; j < 2; j++){
        if(i == 0 && j == 0){
          suma += this.board[(this.alto+i)%this.alto][(this.ancho+j)%this.ancho].sumaColores();
        }
      }
    }
    return suma;
  }
  
  Cell getCell(int i, int j){
    return this.board[i][j];
    }
    
   void setNewCell(int i, int j, Cell cell){
     if(i < this.board.length && j < this.board[0].length){
       this.board[i][j] = cell;
     }
   }
   
   Board copia(){
    Board copia = new Board();
    for(int i = 0; i < this.board.length; i++){
      for(int j = 0; j < this.board[i].length; j++){
        copia.setNewCell(i,j, this.board[i][j]);
      }
    }
    return copia;
  }
  
//
}
