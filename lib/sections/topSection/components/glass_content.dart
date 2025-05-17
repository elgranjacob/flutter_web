// Importa el paquete de efectos visuales como desenfoque (blur)
import 'dart:ui';

// Importa la librería principal de Flutter para interfaces gráficas
import 'package:flutter/material.dart';

// Importa constantes globales como paddings
import '../../../constants.dart';

// Define un widget sin estado llamado GlassContent
class GlassContent extends StatelessWidget {
  const GlassContent({
    Key? key,
    required this.size, // Recibe el tamaño del contenedor padre para adaptarse
  }) : super(key: key);

  final Size size; // Almacena el tamaño de la pantalla o del contenedor exterior

  @override
  Widget build(BuildContext context) {
    return ClipRRect( // Clip con bordes redondeados
      borderRadius: BorderRadius.circular(10), // Aplica esquinas redondeadas al contenedor

      // BackdropFilter permite aplicar efectos como desenfoque al fondo
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Aplica desenfoque de 10 px en X y Y

        // Contenedor transparente encima del fondo desenfocado
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2), // Relleno lateral

          // Restringe tamaño máximo según el tamaño recibido
          constraints: BoxConstraints(
            maxWidth: 1110,
            maxHeight: size.height * 0.7, // Usa el 70% de la altura del contenedor padre
          ),

          width: double.infinity, // Ocupa todo el ancho disponible

          color: Colors.white.withOpacity(0), // Color totalmente transparente (para que el blur sea visible)

          // Coloca el texto dentro de una columna vertical
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
            mainAxisAlignment: MainAxisAlignment.center,  // Centra verticalmente dentro del contenedor

            children: [
              // Primer texto: saludo
              Text(
                "Hello There!",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall! // Usa estilo headline del tema
                    .copyWith(color: Colors.white), // Cambia el color a blanco
              ),

              // Segundo texto: nombre principal
              Text(
                "Jacob \nAvila", // Salto de línea incluido
                style: TextStyle(
                  fontSize: 100, // Tamaño muy grande
                  fontWeight: FontWeight.bold, // Negrita
                  color: Colors.white, // Color blanco
                  height: 1.5, // Interlineado
                ),
              ),

              // Tercer texto: descripción o subtítulo
              Text(
                "ITM Studet | Dev in process", // Frase personalizada
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall! // Estilo headline del tema
                    .copyWith(color: Colors.white), // Texto en blanco
              ),
            ],
          ),
        ),
      ),
    );
  }
}
