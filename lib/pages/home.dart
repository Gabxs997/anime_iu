import 'package:anime_iu/models/anime.dart'; // Importa el modelo Anime para usar en la aplicación.
import 'package:anime_iu/models/nav_bar.dart'; // Importa el widget de la barra de navegación.
import 'package:anime_iu/utils/anime_ui_for_youtube_colors.dart'; // Importa los colores personalizados utilizados en la aplicación.
import 'package:anime_iu/widgets/silver_header_delegate.dart'; // Importa el delegate de encabezado plateado.
import 'package:flutter/material.dart'; // Importa los widgets y utilidades de Material Design.
import 'package:flutter_svg/svg.dart'; // Importa la librería para trabajar con imágenes SVG.

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // Define la clase HomePage como un StatelessWidget.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // ignore: prefer_const_constructors
            Body(), // Muestra el widget Body en la parte superior de la pila de widgets.
            NavBar(), // Muestra el widget de la barra de navegación en la parte inferior de la pila de widgets.
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  // ignore: use_super_parameters
  NavBar({Key? key}) : super(key: key); // Constructor de la clase NavBar.

  final _index = ValueNotifier<int>(0); // Un ValueNotifier para manejar el índice seleccionado en la barra de navegación.

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter, // Alinea la barra de navegación en la parte inferior del contenedor.
      child: Container(
        height: kBottomNavigationBarHeight * 1.4, // Establece la altura de la barra de navegación.
        decoration: BoxDecoration(
          color: AnimeUiForYouTubeColors.background, // Establece el color de fondo de la barra de navegación.
          boxShadow: [
            BoxShadow(
              color: AnimeUiForYouTubeColors.cyan.withOpacity(.45), // Establece el color de la sombra de la barra de navegación.
              spreadRadius: 7.5, // Establece el radio de dispersión de la sombra.
              blurRadius: 15, // Establece el radio de desenfoque de la sombra.
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10), // Añade relleno horizontal al contenedor.
        child: Row(
          children: List.generate(
            itemsNavBar.length,
            (index) => Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: _index, // Escucha los cambios en el índice seleccionado.
                builder: (__, value, ___) {
                  return GestureDetector(
                    onTap: () => _index.value = index, // Cambia el valor del índice al ser tocado.
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            itemsNavBar[index].path, // Carga la imagen SVG correspondiente al índice.
                            width: 30,
                            height: 30,
                            // ignore: deprecated_member_use
                            color: (index == value) ? AnimeUiForYouTubeColors.cyan : Colors.grey, // Cambia el color de la imagen dependiendo del índice seleccionado.
                          ),
                          const SizedBox(height: 5), // Añade un espacio vertical.
                          Text(
                            itemsNavBar[index].name, // Muestra el nombre correspondiente al índice.
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.button?.copyWith(
                                  color: (index == value) ? AnimeUiForYouTubeColors.cyan : Colors.white, // Cambia el color del texto dependiendo del índice seleccionado.
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  }); // Constructor de la clase Body.

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        Header(), // Muestra el encabezado.
        Trends(), // Muestra los elementos tendenciales.
        Recents(), // Muestra los elementos recientes.
        Aviable(), // Muestra los elementos disponibles.
        SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight * 1.4)), // Añade un espacio al final de la lista.
      ],
    );
  }
}

class Aviable extends StatelessWidget {
  const Aviable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Muestra el título "Aviable: Kietsu No Yalba" con estilos específicos.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Aviable: Kietsu No Yalba',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            // Muestra una imagen con aspect ratio 16:9 y un icono de reproducción.
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/kimetsu.png',
                      fit: BoxFit.cover,
                      width: 200, // Establece el ancho de la imagen.
                      height: 200, // Establece la altura de la imagen.
                    ),
                  ),
                  Align(
                    child: SvgPicture.asset(
                      'assets/icons/play.svg',
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Recents extends StatelessWidget {
  const Recents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AspectRatio(
          aspectRatio: 16 / 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Muestra el título "Recently added" con estilos específicos.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recently added',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              // Muestra la lista de elementos recientes.
              const ListRecents(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListRecents extends StatelessWidget {
  const ListRecents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calcula el ancho y la altura de cada elemento de la lista.
          final itemWidth = constraints.maxWidth * 0.25;
          final itemHeight = constraints.maxHeight * 0.8; // Reducir la altura

          return ListView.builder(
            itemCount: recentsData.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, top: 10),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  width: itemWidth,
                  height: itemHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRect(
                      child: Image.asset(
                        recentsData[index].poster,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Trends extends StatelessWidget {
  const Trends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Muestra la sección de tendencias con su encabezado y lista de tendencias.
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: AspectRatio(
          aspectRatio: 16 / 12,
          child: Column(
            children: [
               HeaderTrends(), // Muestra el encabezado de tendencias.
               ListTrends(), // Muestra la lista de tendencias.
            ],
          ),
        ),
      ),
    );
  }
}

class ListTrends extends StatelessWidget {
  const ListTrends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (__, constraints) {
          // Construye una lista horizontal de elementos de tendencias.
          return ListView.builder(
            itemCount: trendsData.length, // Número de elementos en la lista de tendencias.
            scrollDirection: Axis.horizontal, // Desplazamiento horizontal de la lista.
            padding: const EdgeInsets.only(top: 10, left: 20), // Relleno superior e izquierdo.
            itemBuilder: (__, index) {
              final anime = trendsData[index]; // Obtener el anime en el índice actual.
              final style = Theme.of(context).textTheme.button?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ); // Estilo de texto para puntuación y número.

              return Padding(
                padding: const EdgeInsets.only(right: 20), // Relleno derecho.
                child: SizedBox(
                  height: constraints.maxHeight, // Usar el maxHeight para ajustar el tamaño.
                  width: constraints.maxWidth * .375, // Ancho basado en el ancho máximo.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            anime.poster,
                            fit: BoxFit.cover, // Ajuste de la imagen al contenedor.
                          ),
                        ),
                      ),
                      const SizedBox(height: 15), // Espacio vertical.
                      Text(
                        anime.name, // Nombre del anime.
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 7.5), // Espacio vertical.
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/logo_evil.svg'), // Icono SVG.
                          const SizedBox(width: 5), // Espacio horizontal.
                          Text('Score: ${anime.score}', style: style), // Puntuación del anime.
                          const SizedBox(width: 7.5), // Espacio horizontal.
                          Text(
                            '# ${anime.number}',
                            style: style?.copyWith(color: AnimeUiForYouTubeColors.cyan), // Número del anime.
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HeaderTrends extends StatelessWidget {
  const HeaderTrends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Trends', // Título de la sección de tendencias.
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Text(
            'View all', // Enlace para ver todas las tendencias.
            style: (Theme.of(context).textTheme.subtitle2!.copyWith(
                color: AnimeUiForYouTubeColors.cyan,
                fontWeight: FontWeight.w700)),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SilverCustomHeaderDeLegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
          color: AnimeUiForYouTubeColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [
                Expanded(
                  child: Text(
                    'My anime Stream', // Título de la aplicación.
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: AnimeUiForYouTubeColors.cyan),
                  ),
                ),
                Icon(Icons.search, color: Colors.white, size: 30), // Icono de búsqueda.
              ]),
              const SizedBox(
                height: 5,
              ),
              Text(
                'What would you like to watch today?', // Pregunta para el usuario.
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
