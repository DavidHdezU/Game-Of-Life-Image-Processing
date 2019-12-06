/** 
* Clase Board que modela una matriz de pixeles, es decir, una imagen 
* @author David Hernandez Uriostegui
* @version 1.0
* 05/12/2019
*/
class Board{
  Cell[][] board;
  int alto;
  int ancho;
  /**
  *@param board - Matriz de pixeles
  *@param alto - número de filas de la matriz
  *@param ancho - número de renglones de la matriz
  **/
  
  /* 
  * Constructor de la clase Board
  * @param i - filas de la matriz
  * @param j - renglones de la matriz
  */
  Board(int i, int j){
    this.alto = i;
    this.ancho = j;
    this.board = new Cell[i][j];
  }
  
  /* Getter del las filas 
  * @param int - numero de filas
  */
  int getAlto(){
    return this.alto;
  }
  
  /* Getter de los renglones
  * @param int - numero de renglones
  */
  int getAncho(){
    return this.ancho;
  }

  /* Metodo que calcula la suma de los colores de los vecinos de una celula
  * return int - la suma de los vecinos segun la vecindad de Moore
  */
  int sumaColorV(){
    int suma = 0;
    for(int i= -1; i < 1; i++){
      for(int j = -1; j < 1; j++){
        if(i == 0 && j == 0){
          suma = suma + this.board[(this.alto+i)%this.alto][(this.ancho+j)%this.ancho].sumaColores();
        }
      }
    }
    return suma;
  }
  
  /* Getter de una celula en una posicion en particular
  * @param i - la posicion en la fila
  * @param j . la posicion en el renglon
  */
  Cell getCell(int i, int j){
    return this.board[i][j];
    }
    
    /* Setter de una celular a una determinada posicion
    * @param i - posicion en la fila
    * @param j - posicion en el renglon
    * @param cell - Celula a la cual se le va a aseginar el valor nuevo
    */
   void setNewCell(int i, int j, Cell cell){
     if(i < this.board.length && j < this.board[0].length){
       this.board[i][j] = cell;
     }
   }
  
//
}
