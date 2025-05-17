// Importa las herramientas visuales de Flutter
import 'package:flutter/material.dart';

// Importa tus constantes personalizadas (como kDefaultPadding)
import '../../../constants.dart';

// Define un widget sin estado (StatelessWidget) llamado AboutTextWithSign
class AboutTextWithSign extends StatelessWidget {
  const AboutTextWithSign({
    Key? key, // Clave opcional para identificar este widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( // Organiza los elementos verticalmente
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
      children: [
        // Texto principal, dividido en dos líneas con \n
        Text(
          "About \nmy story",
          style: Theme.of(context) // Usa el estilo del tema actual
              .textTheme
              .displayMedium! // Estilo grande, como título H1
              .copyWith( // Modifica el peso y el color del texto
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),

        // Espacio vertical entre el texto y la imagen
        SizedBox(height: kDefaultPadding * 2),

        // Imagen de firma (por ejemplo, una firma personalizada en PNG)
        Image.asset("assets/images/sign.png"),
      ],
    );
  }
}
