//import 'package:flutter/cupertino.dart';
// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /*final AuthService _auth = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String error = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }*/

  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario = await ref.get();

      // ignore: prefer_is_empty
      if (usuario.docs.isNotEmpty) {
        for (var cursor in usuario.docs) {
          if (cursor.get('user') == user.text) {
            print('Usuario encontrado');
            if (cursor.get('password') == pass.text) {
              print('Acceso aceptado');
              Navigator.pushReplacementNamed(context, "homeScreen");
              return;
            }
          }
        }
        print('Usuario o contraseña incorrectos');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o contraseña incorrectos')),
        );
      } else {
        print(
            'No existe la cuenta, verifique su usuario o su contraseña nuevamente');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'No existe la cuenta, verifique su usuario o su contraseña nuevamente')),
        );
      }
    } catch (e) {
      print('ERROR...' + e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ERROR... ' + e.toString())),
      );
    }
  }

  onLoginPressed() {
    if (user.text.isEmpty || pass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debe completar los datos')),
      );
    } else if (!user.text.contains('@gmail.com')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('El correo electrónico debe contener un @gmail.com')),
      );
    } else {
      validarDatos();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // ajusta el tamaño y el diseño de los widgets como "responsives"
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: size.height,
            width: size.width,
            color: const Color.fromRGBO(20, 0, 37, 1).withOpacity(1.0)),
        SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/image2.png",
                    width: size.width * 0.9,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(),
                  const Text(
                      "Series, películas y los deportes que más te gustan se encuentran aquí, en un solo lugar!\n Únete a nosotros y disfrutalo al máximo...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, //w700, w300
                          fontFamily: 'AvenirLTStd',
                          fontSize: 18,
                          color: Colors.white)),
                  const SizedBox(
                    height: 40,
                  ),
                  /*_InputField(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    onLoginPressed: _handleLogin,
                  ),*/

                  /*void _handleLogin() async{
                    dynamic result = await _auth.signInWidthEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                    );
                    if(mounted) {
                      if (result != null) {
                        Navigator.pushReplacementNamed(context, "homeScreen");
                      } else {
                        _showMyDialog(context);
                      }
                    }
                  }*/
                  TextField(
                    controller: user,
                    style: const TextStyle(
                        color: Colors
                            .white), // darle color al texto dentro del textbox
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                      labelStyle: TextStyle(
                          color: Colors.white70), //titulo del textfield
                      /*prefixIcon:
                          Icon(Icons.text_fields, color: Colors.white70),*/ //icono Tt al lado extremo del textbox
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: pass,
                    style: const TextStyle(
                        color: Colors
                            .white), // darle color al texto dentro del textbox
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(
                          color: Colors.white70), //titulo del textfield
                      /*prefixIcon:
                          Icon(Icons.text_fields, color: Colors.white70),
                      fillColor: Colors.white,*/ //icono Tt al lado extremo del textbox
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                      /*onTap: () {
                        Navigator.pushReplacementNamed(context, "homeScreen");
                      },*/
                      child: Container(
                          height: size.height * 0.06,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 0, 85),
                                Color.fromARGB(255, 255, 115, 80)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: onLoginPressed,
                            /*print('enviando...');
                              validarDatos();
                              Navigator.pushReplacementNamed(
                                  context, "homeScreen");*/
                            child: const Center(
                              child: Text(
                                "Iniciar sesión",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ))),
                  const SizedBox(
                    height: 11,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "registerScreen");
                    },
                    child: const Text("No tienes cuenta aún?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
