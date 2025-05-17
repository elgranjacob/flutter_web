// Importa la librería de Flutter para acceder a componentes visuales como botones, textos, filas, etc.
import 'package:flutter/material.dart';

// Importa un archivo local donde defines constantes (como paddings o colores por defecto)
import '../constants.dart';

// Define un widget personalizado llamado DefaultButton, que no tiene estado (StatelessWidget)
class DefaultButton extends StatelessWidget {
  // Constructor del botón, recibe 3 parámetros obligatorios: una imagen, un texto, y una función (onPressed)
  const DefaultButton({
    Key? key,                   // Permite pasar una clave opcional para identificar el widget
    required this.imageSrc,     // Ruta de la imagen que se mostrará en el botón
    required this.text,         // Texto que se mostrará junto a la imagen
    required this.press,        // Función que se ejecutará al presionar el botón
  }) : super(key: key);

  // Declaración de variables finales (no cambian durante el ciclo de vida del widget)
  final String imageSrc, text;    // Ruta de la imagen y el texto a mostrar
  final Function()? press;        // Función opcional a ejecutar cuando se presione el botón

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // Estilo del botón: colores, padding, forma
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFFDAE8F9), // Color del texto/icono al presionar
        padding: EdgeInsets.symmetric(
          vertical: kDefaultPadding,        // Padding vertical (arriba/abajo)
          horizontal: kDefaultPadding * 2.5, // Padding horizontal (izquierda/derecha)
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Bordes redondeados
        ),
      ),
      onPressed: press, // Ejecuta la función que se pasó al constructor al presionar el botón
      child: Row( // El contenido del botón se organiza en una fila horizontal
        children: [
          Image.asset(imageSrc, height: 40),     // Imagen con altura de 40 pixeles
          SizedBox(width: kDefaultPadding),      // Espacio entre la imagen y el texto
          Text(text),                            // Texto a mostrar en el botón
        ],
      ),
    );
  }
}
