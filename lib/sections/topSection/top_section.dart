// Importa la biblioteca base de Flutter para construcción de interfaces
import 'package:flutter/material.dart';

// Importa constantes definidas como kDefaultPadding, colores, etc.
import 'package:flutter_web/constants.dart';

// Importa componentes personalizados que forman parte de la sección superior
import 'components/logo_blur_box.dart';  // Widget con logo y efecto de desenfoque
import 'components/menu.dart';          // Widget para el menú de navegación inferior
import 'components/person_pic.dart';    // Imagen o avatar de la persona destacada

// Define el widget sin estado llamado TopSection
class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene las dimensiones de la pantalla actual
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center, // Centra todo el contenido dentro del contenedor

      // Restringe la altura del contenedor entre 700 y 900 píxeles
      constraints: BoxConstraints(
        maxHeight: 900,
        minHeight: 700,
      ),

      width: double.infinity, // Ocupa todo el ancho disponible de la pantalla

      // Agrega una imagen como fondo decorativo
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover, // Escala la imagen para que cubra todo el contenedor
          image: AssetImage("assets/images/background.png"), // Ruta de la imagen de fondo
        ),
      ),

      // Contenedor interno que encapsula los elementos superpuestos
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding), // Espacio superior interior
        width: 1200, // Ancho máximo del contenido central

        // Utiliza un Stack para superponer varios widgets en capas
        child: Stack(
          children: [
            // Widget que muestra el logo junto con un fondo desenfocado
            LogoAndBlurBox(size: size),

            // Imagen de la persona ubicada en la parte inferior derecha
            Positioned(
              bottom: 0,
              right: 0,
              child: PersonPic(),
            ),

            // Menú de navegación posicionado en la parte inferior izquierda
            Positioned(
              bottom: 0,
              child: Menu(),
            ),
          ],
        ),
      ),
    );
  }
}
