/**
 *Excepcion que indica que el tamaño de una imagen no es correcto
 * @author David Hernandez Uriostegui
 * @version 1.0
 * 05/12/2019
 */
class SizeException extends Exception{
  
  /* Constructor de la excepcion
  * @param mensaje - mensaje que se enviara
  */
  SizeException(String mensaje){
    super(mensaje);
  }
}
