// Importa la biblioteca de Flutter necesaria para construir la UI
import 'package:flutter/material.dart';

// Importa tus constantes personalizadas (como paddings o sombras)
import '../../../constants.dart';

// Define un widget con estado (StatefulWidget) llamado SocalCard
class SocalCard extends StatefulWidget {
  const SocalCard({
    Key? key,                   // Clave opcional del widget
    required this.iconSrc,     // Ruta de la imagen del ícono social
    required this.name,        // Nombre que se mostrará (texto del contacto/red)
    required this.color,       // Color de fondo personalizado
    required this.press,       // Función a ejecutar cuando se presiona
  }) : super(key: key);

  final String iconSrc, name; // Variables que contienen la imagen y el nombre
  final Color color;          // Color de fondo de la tarjeta
  final Function()? press;    // Función (callback) que se ejecuta al hacer tap

  @override
  _SocalCardState createState() => _SocalCardState(); // Crea el estado del widget
}

// Estado interno del widget
class _SocalCardState extends State<SocalCard> {
  bool isHover = false; // Controla si el mouse está sobre el widget (hover)

  @override
  Widget build(BuildContext context) {
    return FittedBox( // Hace que el contenido se adapte sin desbordarse
      child: InkWell( // Hace el contenedor "tappable" y "hoverable"
        onTap: widget.press, // Acción al hacer clic o tocar
        onHover: (value) { // Detecta si el mouse está encima
          setState(() {
            isHover = value; // Actualiza el estado si hay hover
          });
        },
        child: AnimatedContainer( // Contenedor animado que reacciona al hover
          duration: Duration(milliseconds: 200), // Duración de la animación
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding / 2, // Padding vertical
            horizontal: kDefaultPadding * 1.5, // Padding horizontal
          ),
          decoration: BoxDecoration(
            color: widget.color, // Color de fondo definido al instanciar
            borderRadius: BorderRadius.circular(10), // Bordes redondeados
            boxShadow: [
              if (isHover) kDefaultCardShadow, // Aplica sombra solo si está en hover
            ],
          ),
          child: Row( // Contenido de la tarjeta: ícono + texto
            children: [
              Image.asset(
                widget.iconSrc, // Ruta del ícono de red social
                height: 80,     // Tamaño del ícono
                width: 80,
              ),
              SizedBox(width: kDefaultPadding), // Espacio entre ícono y texto
              Text(widget.name), // Nombre del contacto o red social
            ],
          ),
        ),
      ),
    );
  }
}
