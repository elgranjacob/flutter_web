// Importa la librería de Flutter para construir widgets visuales
import 'package:flutter/material.dart';

// Importa el widget GlassContent que contiene el texto principal con efecto de desenfoque
import 'glass_content.dart';

// Define un widget sin estado llamado LogoAndBlurBox
class LogoAndBlurBox extends StatelessWidget {
  const LogoAndBlurBox({
    Key? key,
    required this.size, // Tamaño de pantalla o del contenedor padre, necesario para calcular altura del GlassContent
  }) : super(key: key);

  final Size size; // Variable que contiene el tamaño de la pantalla/contenedor

  @override
  Widget build(BuildContext context) {
    return Column( // Organiza verticalmente los elementos
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido al inicio (izquierda)

      children: [
        // Muestra el logo personalizado de Jacob
        Image.asset(
          "assets/images/logo_jacob.png", // Ruta del logo en assets
          height: 250, // Altura del logo
          width: 250,  // Ancho del logo
        ),

        // Spacer: espacio flexible que empuja el contenido siguiente hacia abajo
        Spacer(),

        // Muestra el widget con el contenido desenfocado y textos personalizados
        GlassContent(size: size), // Se pasa el tamaño recibido

        // Otro spacer más grande que el anterior (flex: 3) para empujar lo que esté debajo
        Spacer(flex: 3),
      ],
    );
  }
}
