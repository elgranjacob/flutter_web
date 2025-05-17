// Importa la librería de Flutter con componentes visuales
import 'package:flutter/material.dart';

// Importa constantes como colores y paddings definidos por ti
import '../constants.dart';

// Define un widget sin estado llamado SectionTitle
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,     // Título principal (más grande y destacado)
    required this.subTitle,  // Subtítulo (más pequeño, informativo)
    required this.color,     // Color que se usará para la línea decorativa
  }) : super(key: key);

  // Variables finales que se asignan en el constructor
  final String title, subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Márgenes verticales alrededor del contenedor
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),

      // Limita el ancho máximo del contenedor a 1110 px
      constraints: BoxConstraints(maxWidth: 1110),

      // Altura fija de 100 px
      height: 100,

      // Contenido organizado en una fila horizontal
      child: Row(
        children: [
          // Línea decorativa vertical a la izquierda
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding), // Espacio a la derecha de la línea
            padding: EdgeInsets.only(bottom: 72),             // Empuja el contenido hacia arriba
            width: 8,                                         // Grosor de la línea
            height: 100,                                      // Altura total de la línea
            color: Colors.black,                              // Color de fondo del contenedor (se ve como borde)
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color, // Color real de la franja (pasado desde fuera del widget)
              ),
            ),
          ),

          // Columna con subtítulo y título
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaciado uniforme vertical
            children: [
              // Texto del subtítulo
              Text(
                subTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w200, // Letra delgada
                  color: kTextColor,           // Color definido en tus constantes
                ),
              ),

              // Texto del título principal
              Text(
                title,
                style: Theme.of(context)           // Usa el estilo del tema actual
                    .textTheme
                    .displayMedium!                // Estilo grande (como H1)
                    .copyWith(                     // Sobrescribe el peso y color
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}
