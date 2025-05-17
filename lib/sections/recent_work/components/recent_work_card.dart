// Importa librerías base de Flutter para UI
import 'package:flutter/material.dart';

// Importa la lista de trabajos recientes (modelo con título, imagen, categoría, etc.)
import 'package:flutter_web/models/recent_works.dart';

// Importa constantes como paddings, sombras, etc.
import '../../../constants.dart';

// Widget con estado para mostrar una tarjeta interactiva de proyecto reciente
class RecentWorkCard extends StatefulWidget {
  const RecentWorkCard({
    Key? key,
    required this.index, // Índice para acceder al trabajo desde la lista
    required this.press, // Acción al hacer clic en la tarjeta
  }) : super(key: key);

  final int index;
  final Function()? press;

  @override
  _RecentWorkCardState createState() => _RecentWorkCardState(); // Crea el estado del widget
}

// Estado del widget que controla el efecto hover
class _RecentWorkCardState extends State<RecentWorkCard> {
  bool isHover = false; // Variable para saber si el mouse está encima

  @override
  Widget build(BuildContext context) {
    return InkWell( // Widget que detecta interacción como hover y tap
      onTap: widget.press, // Ejecuta la acción al hacer clic
      onHover: (value) { // Detecta si el mouse entra o sale
        setState(() {
          isHover = value; // Actualiza el estado para mostrar sombra si aplica
        });
      },

      // Contenedor animado que cambia si el mouse está encima
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200), // Duración de la animación
        height: 320, // Altura fija de la tarjeta
        width: 540, // Ancho fijo de la tarjeta
        decoration: BoxDecoration(
          color: Colors.white, // Fondo blanco
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
          boxShadow: [if (isHover) kDefaultCardShadow], // Aplica sombra solo en hover
        ),

        // Asegura que el contenido se adapte si hay restricciones de espacio
        child: Flexible(
          child: Row( // Organiza imagen y texto en una fila
            children: [
              // Muestra la imagen del proyecto
              Image.asset(recentWorks[widget.index].image),

              // Contenido textual
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding), // Espaciado lateral
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
                    mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente
                    children: [
                      // Categoría del proyecto (en mayúsculas)
                      Text(recentWorks[widget.index].category.toUpperCase()),

                      SizedBox(height: kDefaultPadding / 2), // Espacio entre textos

                      // Título del proyecto con estilo de encabezado
                      Text(
                        recentWorks[widget.index].title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(height: 1.5),
                      ),

                      SizedBox(height: kDefaultPadding), // Espacio antes del enlace

                      // Enlace simulado "View Details"
                      Text(
                        "View Details",
                        style: TextStyle(decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
