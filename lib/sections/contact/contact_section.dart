// Importa la librería principal de Flutter para construir interfaces gráficas
import 'package:flutter/material.dart';

// Importa componentes personalizados y constantes usadas en la sección
import 'package:flutter_web/components/default_button.dart';
import 'package:flutter_web/components/section_title.dart';
import 'package:flutter_web/constants.dart';
import 'components/socal_card.dart';

// Widget principal que contiene toda la sección de contacto
class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Hace que el contenedor ocupe todo el ancho

      // Fondo decorativo con un color claro y una imagen
      decoration: BoxDecoration(
        color: Color(0xFFE8F0F9), // Color base de fondo
        image: DecorationImage(
          fit: BoxFit.cover, // Escala la imagen para cubrir todo el contenedor
          image: AssetImage("assets/images/bg_img_2.png"), // Ruta de la imagen
        ),
      ),

      // Contenido de la sección, organizado verticalmente
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 2.5), // Espaciado arriba del título

          // Título de la sección
          SectionTitle(
            title: "Contact Me", // Título principal
            subTitle: "For Project inquiry and information", // Subtítulo explicativo
            color: Color(0xFF07E24A), // Color decorativo de la línea izquierda
          ),

          ContactBox(), // Caja blanca que contiene redes sociales + formulario
        ],
      ),
    );
  }
}

// Contenedor blanco que muestra tarjetas sociales y el formulario de contacto
class ContactBox extends StatelessWidget {
  const ContactBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1110), // Ancho máximo del formulario
      margin: EdgeInsets.only(top: kDefaultPadding * 2), // Separación superior
      padding: EdgeInsets.all(kDefaultPadding * 3), // Relleno interno

      // Decoración del contenedor: fondo blanco y esquinas superiores redondeadas
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),

      // Contenido del ContactBox organizado en columna
      child: Column(
        children: [
          // Fila con tres tarjetas sociales
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribución equitativa
            children: [
              // Primer ícono social: Skype
              Flexible(
                child: Column(
                  children: [
                    SocalCard(
                      color: Color(0xFFD9FFFC), // Fondo celeste claro
                      iconSrc: "assets/images/skype.png", // Ícono de Skype
                      name: 'TheFlutterWay', // Nombre o identificador
                      press: () {}, // Acción al presionar
                    ),
                  ],
                ),
              ),
              // Segundo ícono social: WhatsApp
              Flexible(
                child: Column(
                  children: [
                    SocalCard(
                      color: Color(0xFFE4FFC7), // Verde claro
                      iconSrc: "assets/images/whatsapp.png",
                      name: 'TheFlutterWay',
                      press: () {},
                    ),
                  ],
                ),
              ),
              // Tercer ícono social: Messenger
              Flexible(
                child: Column(
                  children: [
                    SocalCard(
                      color: Color(0xFFE8F0F9), // Azul claro
                      iconSrc: "assets/images/messanger.png",
                      name: 'TheFlutterWay',
                      press: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: kDefaultPadding * 2), // Separación entre íconos y formulario

          ContactForm(), // Formulario para enviar información de contacto
        ],
      ),
    );
  }
}

// Formulario que contiene varios campos y un botón para enviar mensaje
class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap( // Organiza los campos de forma responsive
        spacing: kDefaultPadding * 2.5, // Espacio horizontal entre campos
        runSpacing: kDefaultPadding * 1.5, // Espacio vertical entre líneas

        children: [
          // Campo: Nombre
          SizedBox(
            width: 470, // Ancho del campo
            child: TextFormField(
              onChanged: (value) {}, // Acción al cambiar texto
              decoration: InputDecoration(
                labelText: "Your Name", // Etiqueta visible
                hintText: "Enter Your Name", // Texto guía
              ),
            ),
          ),
          // Campo: Correo electrónico
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "Enter your email address",
              ),
            ),
          ),
          // Campo: Tipo de proyecto
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Type",
                hintText: "Select Project Type",
              ),
            ),
          ),
          // Campo: Presupuesto del proyecto
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Project Budget",
                hintText: "Select Project Budget",
              ),
            ),
          ),
          // Campo: Descripción del proyecto
          SizedBox(
            child: TextFormField(
              onChanged: (value) {},
              maxLines: null, // Permite varias líneas de texto
              keyboardType: TextInputType.multiline, // Activa modo multilínea
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Write some description",
              ),
            ),
          ),
          // Espacio antes del botón
          SizedBox(height: kDefaultPadding * 2),

          // Botón de envío "Contact Me!"
          Center(
            child: FittedBox( // Escala el botón si es necesario
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png", // Ícono en el botón
                text: "Contact Me!", // Texto visible
                press: () {}, // Acción al presionar (vacía por ahora)
              ),
            ),
          )
        ],
      ),
    );
  }
}
