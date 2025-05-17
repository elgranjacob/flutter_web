// Importa librerías principales de Flutter
import 'package:flutter/material.dart';

// Importa el modelo que contiene los datos de feedbacks (nombre, imagen, texto, color)
import 'package:flutter_web/models/feedback.dart';

// Importa las constantes definidas en el proyecto (colores, paddings, sombras)
import '../../../constants.dart';

// Widget con estado que representa una tarjeta individual de feedback
class FeedbackCard extends StatefulWidget {
  const FeedbackCard({
    Key? key,
    required this.index, // Índice del feedback a mostrar desde la lista
  }) : super(key: key);

  final int index; // Variable que identifica qué feedback se mostrará

  @override
  _FeedbackCardState createState() => _FeedbackCardState();
}

// Clase de estado para controlar animaciones y efecto hover
class _FeedbackCardState extends State<FeedbackCard> {
  Duration duration = Duration(milliseconds: 200); // Duración de las animaciones
  bool isHover = false; // Controla si el mouse está encima (hover)

  @override
  Widget build(BuildContext context) {
    return InkWell( // Widget que permite interacción tipo clic y hover
      onTap: () {}, // Acción vacía por ahora al hacer clic
      hoverColor: Colors.transparent, // Elimina el color por defecto del hover
      onHover: (value) { // Detecta si el mouse está encima
        setState(() {
          isHover = value; // Actualiza el estado de hover
        });
      },
      child: AnimatedContainer( // Contenedor animado que reacciona al hover
        duration: duration,
        margin: EdgeInsets.only(top: kDefaultPadding * 3), // Separación superior
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding), // Relleno lateral
        height: 350, // Altura fija de la tarjeta
        width: 350, // Ancho fijo de la tarjeta
        decoration: BoxDecoration(
          color: feedbacks[widget.index].color, // Color de fondo de la tarjeta según el feedback
          borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
          boxShadow: [if (isHover) kDefaultCardShadow], // Sombra si está en hover
        ),
        child: Column( // Contenido de la tarjeta, organizado verticalmente
          children: [
            // Imagen de usuario "flotando" fuera de la tarjeta
            Transform.translate(
              offset: Offset(0, -55), // Mueve la imagen hacia arriba
              child: AnimatedContainer(
                duration: duration,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Imagen en forma circular
                  border: Border.all(color: Colors.white, width: 10), // Borde blanco
                  boxShadow: [if (!isHover) kDefaultCardShadow], // Sombra si NO está en hover
                  image: DecorationImage(
                    image: AssetImage(feedbacks[widget.index].userPic), // Imagen del usuario
                  ),
                ),
              ),
            ),

            // Texto de la reseña del cliente
            Text(
              feedbacks[widget.index].review,
              style: TextStyle(
                color: kTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w300, // Letra delgada
                fontStyle: FontStyle.italic, // Estilo cursiva
                height: 1.5, // Interlineado
              ),
            ),

            SizedBox(height: kDefaultPadding * 2), // Espacio entre texto y nombre

            // Nombre del cliente (por defecto es fijo aquí)
            Text(
              "Ronald Thompson",
              style: TextStyle(fontWeight: FontWeight.bold), // Negrita
            )
          ],
        ),
      ),
    );
  }
}
