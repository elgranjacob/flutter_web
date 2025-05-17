// Importa la librería principal de Flutter
import 'package:flutter/material.dart';

// Importa las constantes definidas, como kDefaultPadding
import '../../../constants.dart';

// Define un widget sin estado que muestra una tarjeta de experiencia
class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    Key? key,
    required this.numOfExp, // Recibe el número de años de experiencia como texto
  }) : super(key: key);

  final String numOfExp; // Variable que guarda los años de experiencia

  @override
  Widget build(BuildContext context) {
    return Container(
      // Margen horizontal exterior de la tarjeta
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),

      // Espaciado interno entre el borde del container y su contenido
      padding: EdgeInsets.all(kDefaultPadding),

      // Dimensiones fijas de la tarjeta
      height: 240,
      width: 255,

      // Primera capa de fondo con color y bordes redondeados
      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF), // Color lila muy suave
        borderRadius: BorderRadius.circular(10),
      ),

      // Segunda caja decorada, sobre la anterior, con más detalles
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFEDD2FC), // Color lila claro más fuerte
          borderRadius: BorderRadius.circular(10),
          boxShadow: [ // Sombra para crear profundidad
            BoxShadow(
              offset: Offset(0, 3), // Sombra hacia abajo
              blurRadius: 6,
              color: Color(0xFFA600FF).withOpacity(0.25), // Sombra lila con opacidad
            ),
          ],
        ),

        // Contenido de la tarjeta organizado verticalmente
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente
          children: [
            Stack(
              // Superpone dos textos para crear efecto de contorno + relleno
              children: [
                // Texto inferior con borde tipo contorno
                Text(
                  numOfExp,
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke // Solo borde
                      ..strokeWidth = 6
                      ..color = Color(0xFFDFA3FF).withOpacity(0.5), // Lila translúcido
                    shadows: [
                      BoxShadow(
                        offset: Offset(0, 5), // Sombra proyectada hacia abajo
                        blurRadius: 10,
                        color: Color(0xFFA600FF).withOpacity(0.5),
                      ),
                    ],
                  ),
                ),

                // Texto superior con relleno blanco
                Text(
                  numOfExp,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100,
                    color: Colors.white,
                  ),
                )
              ],
            ),

            // Espaciado entre el número y el texto
            SizedBox(height: kDefaultPadding / 2),

            // Texto descriptivo inferior
            Text(
              "Years of Experience",
              style: TextStyle(
                color: Color(0xFFA600FF), // Texto en color lila fuerte
              ),
            )
          ],
        ),
      ),
    );
  }
}
