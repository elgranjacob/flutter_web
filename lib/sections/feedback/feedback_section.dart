// Importa el paquete principal de Flutter para construir widgets visuales
import 'package:flutter/material.dart';

// Importa el título de sección reutilizable
import 'package:flutter_web/components/section_title.dart';

// Importa constantes globales como paddings, colores, etc.
import 'package:flutter_web/constants.dart';

// Importa el modelo de feedback (con nombre, review, color, etc.)
import 'package:flutter_web/models/feedback.dart';

// Importa el componente visual que representa cada tarjeta de feedback
import 'components/feedback_card.dart';

// Widget sin estado que representa la sección de testimonios de clientes
class FeedbackSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Espaciado vertical interno de la sección
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),

      // Ancho máximo limitado para centrar contenido en pantalla grande
      constraints: BoxConstraints(maxWidth: 1110),

      // Coloca todos los elementos verticalmente uno bajo otro
      child: Column(
        children: [
          // Título de la sección
          SectionTitle(
            title: "Feedback Received", // Texto grande
            subTitle: "Client’s testimonials that inspired me a lot", // Descripción corta
            color: Color(0xFF00B1FF), // Color decorativo izquierdo
          ),

          // Espacio vertical entre el título y las tarjetas
          SizedBox(height: kDefaultPadding),

          // Fila que contiene las tarjetas de feedback
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye uniformemente

            // Genera una tarjeta por cada feedback en la lista
            children: List.generate(
              feedbacks.length, // Toma el total de feedbacks disponibles
              (index) => FeedbackCard(index: index), // Crea una tarjeta por índice
            ),
          ),
        ],
      ),
    );
  }
}
