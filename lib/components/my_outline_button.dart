// Importa la librería principal de Flutter para construir la interfaz
import 'package:flutter/material.dart';

// Importa el archivo de constantes donde probablemente defines paddings y colores
import '../constants.dart';

// Define un widget sin estado llamado MyOutlineButton
class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    Key? key,                  // Clave opcional para identificar este widget
    required this.imageSrc,   // Ruta de la imagen que se mostrará en el botón
    required this.text,       // Texto a mostrar en el botón
    required this.press,      // Función a ejecutar cuando se presiona el botón
  }) : super(key: key);

  // Declaración de las propiedades del botón
  final String imageSrc, text;     // Imagen y texto del botón
  final Function()? press;         // Callback opcional para el evento de presionado

  @override
  Widget build(BuildContext context) {
    return FittedBox( // Asegura que el contenido del botón se reduzca si es necesario (para pantallas pequeñas)
      child: OutlinedButton( // Botón con borde (outline) sin relleno de color
        style: OutlinedButton.styleFrom(
          // Define el padding interno del botón
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding,            // Espaciado vertical
            horizontal: kDefaultPadding * 2.5,    // Espaciado horizontal más amplio
          ),
          // Define forma redondeada del botón
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Borde redondeado tipo "píldora"
          ),
          // borderSide: BorderSide(color: Color(0xFFEDEDED)), 
          // Línea comentada que, si se descomenta, cambiaría el color del borde
        ),
        onPressed: press, // Acción que se ejecuta al presionar el botón
        child: Row( // Contenido del botón en una fila horizontal
          children: [
            Image.asset( // Muestra una imagen (ícono) dentro del botón
              imageSrc,
              height: 40, // Altura fija de la imagen
            ),
            SizedBox(width: kDefaultPadding), // Espacio entre la imagen y el texto
            Text(text) // Muestra el texto definido en el constructor
          ],
        ),
      ),
    );
  }
}
