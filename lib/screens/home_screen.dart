import 'package:flutter/material.dart';
import 'package:star/Models/banner_model.dart';
import 'package:star/Models/movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController usuario = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //add
    const backgroundColor = Color.fromRGBO(17, 0, 32, 1); //add
    const secondBackgroundColor = Color.fromRGBO(12, 30, 47, 1); //add

    final List<String> categories = ["Movies", "Series", "Deportes"]; //add

    return MaterialApp(
        debugShowCheckedModeBanner: false, //add
        title: 'StarPlus +',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: const TextTheme(
              //add
              bodyLarge: TextStyle(color: Colors.white), //add
              bodyMedium: TextStyle(color: Colors.white)), //add
          iconTheme: const IconThemeData(color: Colors.white), //add
          useMaterial3: true,
        ),
        home: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: Image.asset(
              "assets/image2.png",
              width: size.width * 0.4,
            ),
            backgroundColor: backgroundColor,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                color: secondBackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /*const Icon(
                      Icons.search,
                    ),*/
                    ...categories.map((e) => Text(e))
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  //add
                  child: Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MovieListBanner(),
                        /*ListView.builder( // -> singlechildscrollview: [  ]
                             itemCount: 1,
                             itemBuilder: (context, index) {
                             return*/
                        // "index == 0? ...(): Sized()," para que la imagen de la clase MovieList2(), aparezca en el simulador 1 sola vez

                        const Text("Continuar viendo"),
                        const SizedBox(
                          height: 20,
                        ),

                        const MovieListContinuarViendo(),

                        const Text("Acción"),
                        const SizedBox(
                          height: 20,
                        ),

                        const MovieListAction(),

                        const Text("Comedia"),
                        const SizedBox(
                          height: 20,
                        ),

                        const MovieListComedy(),

                        const Text("Ciencia Ficción"),
                        const SizedBox(
                          height: 20,
                        ),

                        const MovieListScienceFiction()
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
          bottomNavigationBar: Container(
              color: secondBackgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const SafeArea(
                bottom: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home),
                    Icon(Icons.search),
                    Icon(Icons.add),
                    Icon(Icons.download),
                    Icon(Icons.info)
                  ],
                ),
              )),
        ));
  }
}

class MovieListContinuarViendo extends StatelessWidget {
  const MovieListContinuarViendo({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Movie> catalogos = [
      Movie("Fórmula 1 - 30 min", "assets/formula1.jpeg"),
      Movie("Santo Maldito", "assets/peliculacatalogo.jpg"),
      Movie("Sintiendolo mucho", "assets/peliculacatalogo3.jpg"),
      Movie("Impuros", "assets/peliculacatalogo4.jpg")
    ]; // Continuar viendo

    return SizedBox(
      height: size.height * 0.20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catalogos.length,
          itemBuilder: (context, index) {
            return Container(
                //width: size.width * 0.35, //add
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //color: Colors.white, //add
                ), //add
                /*child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            catalogos[index].image,
                            width: size.width * 0.3,
                            height: size.height * 0.17,
                            fit: BoxFit.cover,
                          ),
                          Text(catalogos[index].title),
                        ],
                      ),
                    )
                  ],
                )*/
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        catalogos[index].image,
                        width: size.width * 0.30,
                        height: size.height * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      catalogos[index].title,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ));
          }),
    );
  }
}

class MovieListAction extends StatelessWidget {
  const MovieListAction({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Movie> catalogos = [
      Movie("Babaylon", "assets/movieaction01.jpg"),
      Movie("Oppenheimer", "assets/oppenheimer.jpeg"),
      Movie("TopGun Maverick", "assets/topgun.jpg"),
      Movie("Planeta de los simios", "assets/planetasimios.jpg")
    ]; // Acción

    return SizedBox(
      height: size.height * 0.20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catalogos.length,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                /*child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            catalogos[index].image,
                            width: size.width * 0.3,
                            height: size.height * 0.17,
                            fit: BoxFit.cover,
                          ),
                          Text(catalogos[index].title),
                        ],
                      ),
                    )
                  ],
                )*/
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        catalogos[index].image,
                        width: size.width * 0.28,
                        height: size.height * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      catalogos[index].title,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ));
          }),
    );
  }
}

class MovieListComedy extends StatelessWidget {
  const MovieListComedy({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Movie> catalogos = [
      Movie("El Valet", "assets/valetstar.jpg"),
      Movie("Free Guy", "assets/freeguy.jpg"),
      Movie("Crush", "assets/crush.jpg"),
      Movie("The Kardashians", "assets/kardashians.jpg")
    ];
    return SizedBox(
      height: size.height * 0.20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catalogos.length,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                /*child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            catalogos[index].image,
                            width: size.width * 0.3,
                            height: size.height * 0.17,
                            fit: BoxFit.cover,
                          ),
                          Text(catalogos[index].title),
                        ],
                      ),
                    )
                  ],
                )*/
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        catalogos[index].image,
                        width: size.width * 0.28,
                        height: size.height * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      catalogos[index].title,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ));
          }),
    );
  }
}

class MovieListScienceFiction extends StatelessWidget {
  const MovieListScienceFiction({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Movie> catalogos = [
      Movie("InterStellar", "assets/interstellar.jpg"),
      Movie("Independence Day", "assets/independenceday.jpg"),
      Movie("Elysium", "assets/elysium.jpg"),
      Movie("Depredador", "assets/depredador.jpg")
    ];
    return SizedBox(
      height: size.height * 0.20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catalogos.length,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                /*child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            catalogos[index].image,
                            width: size.width * 0.3,
                            height: size.height * 0.17,
                            fit: BoxFit.cover,
                          ),
                          Text(catalogos[index].title),
                        ],
                      ),
                    )
                  ],
                )*/
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        catalogos[index].image,
                        width: size.width * 0.28,
                        height: size.height * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      catalogos[index].title,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ));
          }),
    );
  }
}

class MovieListBanner extends StatelessWidget {
  const MovieListBanner({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<BannerExample> sponsors = [
      BannerExample("Futbol - En vivo", "assets/futbolpost2.jpeg"),
      BannerExample("ESPN KnockOut - En vivo", "assets/ufcpost2.jpeg"),
      BannerExample("Tenis - En vivo", "assets/tenispost.jpeg"),
      BannerExample("Fórmula 1", "assets/checho.jpg"),
      BannerExample("Películas y más", "assets/variaspeliculas.jpg"),
    ];

    return SizedBox(
      height: size.height *
          0.55, //Para separar la distancia entre las imagenes horizontal
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sponsors.length,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(children: [
                          Image.asset(
                            sponsors[index].image,
                            width: size.width * 0.90,
                            height: size.height * 0.5,
                            fit: BoxFit.cover,
                          ),
                          Text(sponsors[index].title),
                        ])),
                  ],
                ));
          }),
    );
  }
}
