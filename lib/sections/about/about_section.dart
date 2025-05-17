// Importa los componentes de Flutter necesarios para construir la UI
import 'package:flutter/material.dart';

// Importa componentes personalizados usados en la sección
import 'package:flutter_web/components/default_button.dart';
import 'package:flutter_web/components/my_outline_button.dart';
import 'package:flutter_web/constants.dart';

// Importa otros widgets que forman parte de la sección "Acerca de mí"
import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

// Define el widget AboutSection, que es una sección completa de presentación
class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Espacio vertical alrededor del contenedor
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),

      // Limita el ancho máximo a 1110px (bueno para diseño responsivo en web)
      constraints: BoxConstraints(maxWidth: 1110),

      // Coloca todos los elementos verticalmente
      child: Column(
        children: [
          // Primer bloque: una fila con elementos clave de la sección
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaciado entre los elementos
            children: [
              AboutTextWithSign(), // Widget que muestra texto con una firma (tu nombre, por ejemplo)

              // Primer bloque de texto sobre ti
              Expanded(
                child: AboutSectionText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                ),
              ),

              // Tarjeta que muestra experiencia (por ejemplo, "08" años)
              ExperienceCard(numOfExp: "08"),

              // Segundo bloque de texto
              Expanded(
                child: AboutSectionText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                ),
              ),
            ],
          ),

          // Espaciado entre la fila de contenido y los botones
          SizedBox(height: kDefaultPadding * 3),

          // Segunda fila: botones centrados
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón con contorno: "Hire Me!"
              MyOutlineButton(
                imageSrc: "assets/images/hand.png", // Ícono de mano
                text: "Hire Me!",                    // Texto del botón
                press: () {},                        // Acción al presionar (vacía por ahora)
              ),

              // Espacio entre botones
              SizedBox(width: kDefaultPadding * 1.5),

              // Botón con relleno: "Download CV"
              DefaultButton(
                imageSrc: "assets/images/download.png", // Ícono de descarga
                text: "Download CV",                     // Texto del botón
                press: () {},                            // Acción al presionar (vacía por ahora)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
