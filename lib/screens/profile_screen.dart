// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:star/Models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedProfileIndex = -1;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromRGBO(26, 16, 32, 4);
    const secondBackgroundColor = Color.fromRGBO(19, 23, 26, 1); //add

    return MaterialApp(
      debugShowCheckedModeBanner: false, //add
      theme: ThemeData(
        fontFamily: 'AvenirLTStd',
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
          title: const Text(''),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: backgroundColor,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              //add
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileList(
                      selectedIndex: _selectedProfileIndex,
                      onProfileSelected: (index) {
                        setState(() {
                          _selectedProfileIndex = index;
                        });
                      },
                    ),
                    const SizedBox(
                        height: 0), // Espacio entre la lista y el botón
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Botón presionado');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(
                              169, 54, 53, 53), // Color de fondo del botón
                          minimumSize: const Size(200, 50), // Tamaño del botón
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius
                                .zero, // Forma rectangular del botón
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18, // Tamaño del texto
                          ),
                        ),
                        child: const Text('EDITAR PERFILES'),
                      ),
                    ),
                    const SizedBox(
                        height:
                            15), // Espacio entre el botón y las opciones de perfil
                    const ProfileOptionsList(),
                    const SizedBox(
                        height: 20), // Espacio entre las opciones y la versión
                    Align(
                      // alinear el text a la izquierda
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Versión: 2.22.0.58471',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ]),
        bottomNavigationBar: Container(
            color: secondBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: SafeArea(
              bottom: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.home),
                  const Icon(Icons.search),
                  const Icon(Icons.add),
                  const Icon(Icons.download),
                  IconButton(
                    icon: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/perfil1.1.JPG'),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class ProfileList extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onProfileSelected;

  const ProfileList({
    super.key,
    required this.selectedIndex,
    required this.onProfileSelected,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Profile> catalogos = [
      Profile("Mi perfil", "assets/perfilestrella.JPG"),
      Profile("Leus", "assets/perfil1.1.JPG"),
      Profile("Piero", "assets/perfil1.2.JPG"),
      Profile("Messi", "assets/perfil1.3.JPG"),
      Profile("Diego", "assets/perfil1.4.JPG"),
      Profile("Crear perfil", "assets/perfilcrear.JPG"),
    ]; // Continuar viendo

    return SizedBox(
      height: size.height * 0.18,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catalogos.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                onProfileSelected(index);
              },
              /*onTap: () {
                print('Perfil seleccionado: ${catalogos[index].title}');
              },*/
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal:
                          10), //espaciado entre los botones de imagenes de perfiles
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  /* decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //color: Colors.white, //add
                ), //add */
                  child: Container(
                    margin:
                        const EdgeInsets.all(1), // Reduce el radio del borde
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        catalogos[index].image,
                        width: size.width *
                            0.24, // Ajusta el tamaño según sea necesario
                        height: size.width *
                            0.24, // Ajusta el tamaño según sea necesario
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  catalogos[index].title,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ]),
            );
          }),
    );
  }
}

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Cerrar sesión"),
          content: Text(
            "¿Estás seguro de que deseas cerrar sesión?",
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de inicio de sesión
                Navigator.pushNamed(context, "loginScreen");
              },
              child: Text("Sí"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> options = [
      {"title": "Ajustes de la aplicación", "icon": Icons.arrow_forward_ios},
      {"title": "Cuenta", "icon": Icons.arrow_forward_ios},
      {"title": "Avisos legales", "icon": Icons.arrow_forward_ios},
      {"title": "Ayuda", "icon": Icons.arrow_forward_ios},
      {"title": "Cerrar sesión", "icon": Icons.exit_to_app},
    ];

    return Column(
      children: options.map((option) {
        return Column(
          children: [
            ListTile(
              title: Text(
                option['title'],
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              trailing: Icon(option['icon'], color: Colors.white, size: 17),
              onTap: () {
                // Acción al presionar la opción
                if (option['title'] == "Cerrar sesión") {
                  _showLogoutConfirmationDialog(context);
                } else {
                  // Acción al presionar la opción (si es necesario)
                  print('Presionado ${option['title']}');
                }
              },
            ),
            const Divider(
              color: Colors.white,
              height: 1,
              thickness: 0.2,
              indent: 16, // Ajusta la distancia desde el lado izquierdo
              endIndent: 24, // Ajusta la distancia desde el lado derecho
            ),
          ],
        );
      }).toList(),
    );
  }
}
