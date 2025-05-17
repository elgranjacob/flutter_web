// Importa la biblioteca principal de Flutter para construir interfaces visuales
import 'package:flutter/material.dart';

// Importa el widget reutilizable del título de sección
import 'package:flutter_web/components/section_title.dart';

// Importa constantes globales como padding y colores
import 'package:flutter_web/constants.dart';

// Importa el modelo de datos que contiene los servicios ofrecidos
import 'package:flutter_web/models/Service.dart';

// Importa el componente visual que representa cada tarjeta de servicio
import 'components/service_card.dart';

// Define un widget sin estado llamado ServiceSection
class ServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Margen vertical para separar esta sección de otras
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),

      // Restringe el ancho máximo del contenedor a 1110 px
      constraints: BoxConstraints(maxWidth: 1110),

      // Contenido principal de la sección, organizado verticalmente
      child: Column(
        children: [
          // Título de la sección, compuesto por título principal, subtítulo y color decorativo
          SectionTitle(
            color: Color(0xFFFF0000), // Color decorativo del borde izquierdo (rojo)
            title: "Service Offerings", // Título principal
            subTitle: "My Strong Arenas", // Subtítulo explicativo
          ),

          // Fila horizontal que contiene las tarjetas de servicios
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye el espacio entre tarjetas

            // Genera dinámicamente una tarjeta ServiceCard por cada servicio en la lista
            children: List.generate(
              services.length, // Número total de servicios en la lista
              (index) => ServiceCard(index: index), // Crea un ServiceCard para cada servicio
            ),
          )
        ],
      ),
    );
  }
}
