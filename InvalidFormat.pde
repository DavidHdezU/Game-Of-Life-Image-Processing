/** 
 * Excepcion que indica el formato invalido de una imagen
 * @author David Hernandez Uriostegui
 * @version 1.0
 * 05/12/2019
 */
class InvalidFormat extends Exception{
  
  /* Constructor de la excepcion
  * @param mensaje - mensaje que se enviara
  */
  InvalidFormat(String mensaje){
    super(mensaje);
  }
}
