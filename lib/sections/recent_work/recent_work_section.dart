// Importa el paquete principal de Flutter para construir la UI
import 'package:flutter/material.dart';

// Importa el widget de la tarjeta "Hire Me"
import 'package:flutter_web/components/hireme_card.dart';

// Importa el widget reutilizable de título de sección
import 'package:flutter_web/components/section_title.dart';

// Importa las constantes del proyecto como paddings, colores, etc.
import 'package:flutter_web/constants.dart';

// Importa el modelo con los datos de trabajos recientes
import 'package:flutter_web/models/recent_works.dart';

// Importa el widget que representa cada tarjeta de trabajo reciente
import 'components/recent_work_card.dart';

// Define un widget sin estado llamado RecentWorkSection
class RecentWorkSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Margen superior para separar esta sección de la anterior
      margin: EdgeInsets.only(top: kDefaultPadding * 6),
      
      // Hace que el contenedor ocupe todo el ancho disponible
      width: double.infinity,

      // Establece la decoración de fondo con color semitransparente e imagen
      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF).withOpacity(0.3), // Color base con opacidad
        image: DecorationImage(
          fit: BoxFit.cover, // Escala la imagen para cubrir todo el contenedor
          image: AssetImage("assets/images/recent_work_bg.png"), // Imagen de fondo
        ),
      ),

      // Contenido organizado verticalmente
      child: Column(
        children: [
          // Mueve hacia arriba la tarjeta "Hire Me" para que flote sobre esta sección
          Transform.translate(
            offset: Offset(0, -80), // Desplaza 80 píxeles hacia arriba
            child: HireMeCard(), // Muestra la tarjeta personalizada "Hire Me"
          ),

          // Título de la sección con subtítulo y color decorativo
          SectionTitle(
            title: "Recent Woorks", // Título principal (hay un error ortográfico: "Woorks")
            subTitle: "My Strong Arenas", // Subtítulo descriptivo
            color: Color(0xFFFFB100), // Color decorativo lateral del título
          ),

          // Espacio entre el título y las tarjetas de trabajos recientes
          SizedBox(height: kDefaultPadding * 1.5),

          // Contenedor que limita el ancho del contenido a 1110px
          SizedBox(
            width: 1110,

            // Wrap permite que los elementos se acomoden automáticamente en filas
            child: Wrap(
              spacing: kDefaultPadding, // Espacio horizontal entre tarjetas
              runSpacing: kDefaultPadding * 2, // Espacio vertical entre filas

              // Genera una lista de tarjetas usando los datos de recentWorks
              children: List.generate(
                recentWorks.length, // Total de trabajos recientes
                (index) => RecentWorkCard( // Crea una tarjeta por cada índice
                  index: index, // Pasa el índice para acceder al elemento correspondiente
                  press: () {}, // Acción al presionar la tarjeta (vacía por ahora)
                ),
              ),
            ),
          ),

          // Espacio final para cerrar la sección visualmente
          SizedBox(height: kDefaultPadding * 5),
        ],
      ),
    );
  }
}
