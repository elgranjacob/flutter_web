// Importa la librería principal de Flutter para construir la UI
import 'package:flutter/material.dart';

// Importa un archivo local donde defines constantes (colores, estilos, etc.)
import 'package:flutter_web/constants.dart';

// Importa el archivo donde está definida la pantalla principal de la app
import 'package:flutter_web/home_screen.dart';

// Función principal: punto de entrada de la aplicación
void main() {
  runApp(MyApp()); // runApp lanza la aplicación con el widget MyApp como raíz
}

// Clase principal de la aplicación, que extiende StatelessWidget (no tiene estado)
class MyApp extends StatelessWidget {
  // Método build: construye y retorna el widget principal de la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de "debug" en la esquina
      title: 'Flutter Demo', // Título de la app (no visible en todos los dispositivos)
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme, // Usa el tema de input definido en constants.dart
        visualDensity: VisualDensity.adaptivePlatformDensity, // Ajusta la densidad visual según el dispositivo (móvil o escritorio)
      ),
      home: HomeScreen(), // Pantalla principal que se mostrará al abrir la app
    );
  }
}
