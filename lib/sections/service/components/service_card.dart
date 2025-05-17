// Importa la librería base de Flutter para construir interfaces visuales
import 'package:flutter/material.dart';

// Importa el modelo de datos que contiene los servicios (título, imagen, color)
import 'package:flutter_web/models/Service.dart';

// Importa constantes globales como paddings y sombras
import '../../../constants.dart';

// Widget con estado (StatefulWidget) para crear una tarjeta de servicio animada
class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key? key,
    required this.index, // Índice para acceder a un servicio desde la lista
  }) : super(key: key);

  final int index; // Almacena el índice del servicio que se mostrará

  @override
  _ServiceCardState createState() => _ServiceCardState(); // Crea el estado asociado
}

// Clase que controla el estado (hover y animaciones) del widget
class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false; // Booleano que indica si el mouse está encima de la tarjeta
  Duration duration = Duration(milliseconds: 200); // Duración para animaciones

  @override
  Widget build(BuildContext context) {
    return InkWell( // Permite interacción tipo hover y clic
      onTap: () {}, // Acción al hacer clic (vacía por ahora)
      onHover: (value) { // Detecta si el mouse entra o sale del widget
        setState(() {
          isHover = value; // Actualiza el estado para activar animaciones
        });
      },
      hoverColor: Colors.transparent, // Desactiva el color por defecto en hover

      // Contenedor animado que responde al hover
      child: AnimatedContainer(
        duration: duration, // Tiempo de transición
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2), // Margen vertical
        height: 256, // Altura fija de la tarjeta
        width: 256,  // Ancho fijo de la tarjeta
        decoration: BoxDecoration(
          color: services[widget.index].color, // Color de fondo según el servicio
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
          boxShadow: [if (isHover) kDefaultCardShadow], // Sombra solo si está en hover
        ),

        // Contenido de la tarjeta: ícono + título
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente
          children: [
            // Contenedor animado para el ícono o imagen del servicio
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.all(kDefaultPadding * 1.5), // Espacio interior
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco para el ícono
                shape: BoxShape.circle, // Forma circular
                boxShadow: [
                  if (!isHover) // Solo se muestra la sombra cuando NO hay hover
                    BoxShadow(
                      offset: Offset(0, 20), // Desplaza la sombra hacia abajo
                      blurRadius: 30, // Difuminado
                      color: Colors.black.withOpacity(0.1), // Color con opacidad
                    ),
                ],
              ),

              // Imagen del servicio (ícono o representación visual)
              child: Image.asset(
                services[widget.index].image, // Ruta de la imagen desde el modelo
                fit: BoxFit.fill, // Ajusta la imagen al espacio disponible
              ),
            ),

            // Espaciado entre la imagen y el título
            SizedBox(height: kDefaultPadding),

            // Título del servicio
            Text(
              services[widget.index].title, // Título obtenido desde la lista de servicios
              style: TextStyle(fontSize: 22), // Tamaño de fuente
            ),
          ],
        ),
      ),
    );
  }
}
