/**
* Exepcion que indica si un color y si uno de sus canales en invalido 
* @author David Hernandez Uriostegui
* @version 1.0
* 05/12/2019
*/
class NoImage extends Exception{
  
  /* Constructor de la clase
  * @param mensaje - mensaje que se enviara
  */
  
  NoImage(String mensaje){
    super(mensaje);
  }
}
