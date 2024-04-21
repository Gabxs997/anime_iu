import 'package:anime_iu/pages/home.dart'; // Importa la página principal de la aplicación.
import 'package:anime_iu/utils/anime_ui_for_youtube_colors.dart'; // Importa los colores personalizados utilizados en la aplicación.
import 'package:flutter/material.dart'; // Importa los widgets y utilidades de Material Design.
import 'package:flutter/services.dart'; // Importa utilidades para interactuar con el sistema.
import 'package:google_fonts/google_fonts.dart'; // Importa Google Fonts para usar fuentes personalizadas.

void main() => runApp(const MyApp()); // Punto de entrada principal de la aplicación.

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Define la aplicación como un StatelessWidget.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      // Configura el estilo de la superposición del sistema, como el color de la barra de estado.
      // ignore: prefer_const_constructors
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Establece el color de la barra de estado como transparente.
        statusBarIconBrightness: Brightness.light, // Establece el brillo de los íconos de la barra de estado como claro.
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la pancarta de depuración en la esquina superior derecha.
      theme: ThemeData.light().copyWith( // Configura el tema de la aplicación.
        scaffoldBackgroundColor: AnimeUiForYouTubeColors.background, // Establece el color de fondo del scaffold.
        textTheme: GoogleFonts.sourceSans3TextTheme(), // Utiliza fuentes personalizadas de Google Fonts para el texto.
      ),
      home: const HomePage(), // Establece la página principal de la aplicación como HomePage().
    );
  }
}
