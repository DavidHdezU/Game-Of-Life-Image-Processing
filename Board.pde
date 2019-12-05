class Board{
  Cell[][] board;
  int alto;
  int ancho;
  
  Board(int i, int j){
    this.alto = i;
    this.ancho = j;
    this.board = new Cell[i][j];
  }
  
  int getAlto(){
    return this.alto;
  }
  
  int getAncho(){
    return this.ancho;
  }
  
  int sumaColorV(){
    int suma = 0;
    for(int i= -1; i < 1; i++){
      for(int j = -1; j < 1; j++){
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
  
//
}
