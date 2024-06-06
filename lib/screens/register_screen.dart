// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  registroUsuario() async {
    try {
      await firebase.collection('Users').doc().set({
        "user": user.text,
        "password": pass.text,
      });
      print('Se registró correctamente');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Aviso"),
            content: const Text("Se registró correctamente"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "loginScreen");
                },
                child: const Text("Aceptar"),
              )
            ],
          );
        },
      );
      user.clear();
      pass.clear();
    } catch (e) {
      print('ERROR...' + e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ERROR... ' + e.toString())),
      );
    }
  }

  onRegisterPressed() {
    if (user.text.isEmpty || pass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Debe completar los datos')),
      );
    } else if (!user.text.contains('@gmail.com')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('El correo electrónico debe contener un @gmail.com')),
      );
    } else if (pass.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('La contraseña debe tener al menos 6 caracteres')),
      );
    } else {
      registroUsuario();
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
                    height: 60,
                  ),
                  const Row(),
                  const Text("Crea tu cuenta y sé parte de nosotros...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, //w700, w300
                          fontFamily: 'AvenirLTStd',
                          fontSize: 20,
                          color: Colors.white)),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: user,
                    style: const TextStyle(
                        color: Colors
                            .white), // darle color al texto dentro del textbox
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo electrónico',
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
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(
                          color: Colors.white70), //titulo del textfield
                      /*prefixIcon:
                          Icon(Icons.text_fields, color: Colors.white70),*/ //icono Tt al lado extremo del textbox
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "loginScreen");
                    },
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
                        onPressed: onRegisterPressed,
                        child: const Center(
                            child: Text("Registrate aquí!",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 170,
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
