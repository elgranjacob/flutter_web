// Importa la librería principal de Flutter para construir la UI
import 'package:flutter/material.dart';

// Importa las constantes definidas, como el padding por defecto o colores
import '../../../constants.dart';

// Define un widget sin estado que muestra un texto con estilo personalizado
class AboutSectionText extends StatelessWidget {
  const AboutSectionText({
    Key? key,        // Clave opcional para identificar este widget en el árbol de Flutter
    required this.text, // Texto que se mostrará dentro del widget
  }) : super(key: key);

  final String text; // Declaración de la variable final que recibe el texto a mostrar

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Aplica espacio horizontal alrededor del texto
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),

      // Muestra el texto en pantalla
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w200, // Fuente ligera
          color: kTextColor,           // Color definido en tus constantes
          height: 2,                   // Espaciado entre líneas (line-height)
        ),
      ),
    );
  }
}
