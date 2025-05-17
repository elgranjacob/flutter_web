// Importa la librería principal de Flutter para construir la UI
import 'package:flutter/material.dart';

// Importa un archivo local donde están definidas constantes como paddings y sombras
import '../constants.dart';

// Importa el widget personalizado DefaultButton, que es un botón con imagen y texto
import 'default_button.dart';

// Define un widget sin estado llamado HireMeCard
class HireMeCard extends StatelessWidget {
  const HireMeCard({
    Key? key, // Clave opcional para identificar este widget en el árbol
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Espaciado interior (padding) del contenido dentro del contenedor
      padding: EdgeInsets.all(kDefaultPadding * 2),

      // Limita el ancho máximo del contenedor a 1110 px
      constraints: BoxConstraints(maxWidth: 1110),

      // Define la decoración del contenedor: color, bordes redondeados y sombra
      decoration: BoxDecoration(
        color: Colors.white, // Color de fondo blanco
        borderRadius: BorderRadius.circular(20), // Bordes redondeados
        boxShadow: [kDefaultShadow], // Sombra aplicada (definida en constants.dart)
      ),

      // El contenido se organiza en una fila horizontal (Row)
      child: Row(
        children: [
          // Imagen de ícono de correo (80x80 px)
          Image.asset(
            "assets/images/email.png",
            height: 80,
            width: 80,
          ),

          // Separación entre la imagen y el texto con un divisor vertical
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 80,
              child: VerticalDivider(), // Línea vertical decorativa
            ),
          ),

          // El contenido textual ocupa el espacio restante (gracias a Expanded)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
              children: [
                Text(
                  "Starting New Project?", // Título principal
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kDefaultPadding / 2), // Espaciado vertical
                Text(
                  "Get an estimate for the new project", // Subtítulo o mensaje secundario
                  style: TextStyle(fontWeight: FontWeight.w200), // Fuente delgada
                )
              ],
            ),
          ),

          // Botón personalizado a la derecha con ícono y texto
          DefaultButton(
            text: "Hire Me!", // Texto del botón
            imageSrc: "assets/images/hand.png", // Imagen dentro del botón
            press: () {}, // Función a ejecutar cuando se presione el botón (vacía por ahora)
          )
        ],
      ),
    );
  }
}
