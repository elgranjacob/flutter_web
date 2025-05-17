// Importa la biblioteca principal de Flutter para crear widgets
import 'package:flutter/material.dart';

// Importa constantes como padding, colores y sombras definidas en el proyecto
import '../../../constants.dart';

// Define el widget con estado llamado Menu
class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState(); // Crea el estado del widget
}

// Clase de estado del widget Menu
class _MenuState extends State<Menu> {
  int selectedIndex = 0; // Índice del ítem seleccionado actualmente
  int hoverIndex = 0;    // Índice del ítem sobre el que está el mouse

  // Lista de nombres de las secciones del menú
  List<String> menuItems = [
    "Home",
    "About",       
    "Services",
    "Portfolio",
    "Testimonial",
    "Contact"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding lateral interno del menú
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),

      // Establece ancho máximo del menú
      constraints: BoxConstraints(maxWidth: 1110),

      // Altura fija del contenedor del menú
      height: 100,

      // Estilo del fondo del menú
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco

        // Bordes redondeados solo arriba
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),

        // Sombra por debajo del menú
        boxShadow: [kDefaultShadow],
      ),

      // Fila que contiene todos los botones del menú
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribuye uniformemente

        // Genera un botón para cada ítem del menú
        children: List.generate(
          menuItems.length, // Toma la longitud de la lista
          (index) => buildMenuItem(index), // Llama a buildMenuItem para cada índice
        ),
      ),
    );
  }

  // Función que construye visualmente cada ítem del menú
  Widget buildMenuItem(int index) => InkWell(
        onTap: () {
          // Cuando se hace clic, se actualiza el ítem seleccionado
          setState(() {
            selectedIndex = index;
          });
        },
        onHover: (value) {
          // Cuando el mouse entra o sale, se actualiza el índice de hover
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },

        // Contenedor individual del ítem
        child: Container(
          constraints: BoxConstraints(minWidth: 122), // Ancho mínimo por ítem
          height: 100, // Altura igual a la del menú

          // Superpone el texto y las imágenes de selección/hover
          child: Stack(
            alignment: Alignment.center, // Centra el texto e imágenes

            children: [
              // Texto del ítem del menú
              Text(
                menuItems[index], // Obtiene el nombre de la lista
                style: TextStyle(fontSize: 20, color: kTextColor), // Estilo
              ),

              // Imagen de "hover" animada, aparece si el mouse está encima
              AnimatedPositioned(
                duration: Duration(milliseconds: 200), // Suaviza el cambio
                left: 0,
                right: 0,
                bottom: selectedIndex != index && hoverIndex == index ? -20 : -32,
                child: Image.asset("assets/images/Hover.png"), // Imagen de subrayado
              ),

              // Imagen de "seleccionado" animada, aparece justo debajo del ítem activo
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: selectedIndex == index ? -2 : -32,
                child: Image.asset("assets/images/Hover.png"),
              ),
            ],
          ),
        ),
      );
}
