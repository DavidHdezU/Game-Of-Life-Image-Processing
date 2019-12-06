----------- INSTRUCCIONES PARA COMPILAR Y EJECUTAR EL PROGRAMA -----------

REQUESITOS:
- Tener instalado Processing 3, ya que sobre esto está heco el programa.

PASOS PARA COMILAR, EJECUTAR Y USAR

1.- Abrir el sketch GOL_FINAL con Processing

2.- Ahora para poder cargar una imagen esta debe de estar en la carpeta "images_for_debug"

3.- En el programa tenemos una variable llamada "loc2" de tipo String, esa variable se inicializa en el método setUp() como "images_for_debug/tree3.jpg", entonces en principio nos carga la imagen "tree3.jpg".

4.- Si queremos cambiar de imagen en vez de poner "images_for_debug/tree3.jpg", pondriamos:
"images_for_debug/(nombre de la nueva imagen)", o sea por ejemplo si queremos cargar la imagen "galaxy2.jpg" entomces pondriamos "images_for_debug/galaxy2.jpg".

5.- Cuando ya hayamos ingresado la imagen deseada, se tiene que pulsar el boton Ejecutar para comenzar el programa, entonces damos click sobre el.

6.- Al comenzar el programa veremos que va "lento" esto se debe a que en setUp() se usó el método frameRate() con valor de 1, ya que esto permite observar de mejor manera las iteraciones.

7.- Se puede observar que hay 3 botones: "SAVE IMAGE", "RESUME SKETCH" y "PAUSE SKETCH"

8.- SAVE IMAGE lo que hace al dar click sobre el es que guarda una imagen llamada "resultado.jpg" de lo que pasa en el programa en "images_for_debug" 

9.- PAUSE SKETCH lo que hace es pausar la pantalla para ver como quedan los pixeles en el momento que queramos observar(Esto es lo equivalente a el número de iteraciones que queramos hacer ya que no en Processing no podemos leer cosas desde la terminal usando Scanner ): )

10.- RESUME SKETCH lo que hace es quitar la pausa a la pantalla para que el programa sigue corriendo.

11.- Si se quiere tener el tamaño exacto de la imagen en la pantalla del programa en size() se debe meter las dimensiones originales de la imagen deseada, yo lo puse por defecto de 1500x1000 ya que es una buena escala para observar cualquier imagen mayor a 500x500

12.- Y básicamente es todo lo que se debe saber sobre el programa :)

