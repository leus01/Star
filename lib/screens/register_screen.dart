import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key:key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  final firebase =  Firebase;

  registroUsuario() async {
    try{
      await firebase.collection('Users').doc().set()(
        {
          "user":user.text,
          "password":pass.text,
        }
      );
    }catch (e){
      print('ERROR...'+e.toString());
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
                  const TextField(
                    //controller: user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo electrónico',
                      labelStyle: TextStyle(
                          color: Colors.white70), //titulo del textfield
                      prefixIcon:
                          Icon(Icons.text_fields, color: Colors.white70),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    //controller: pass,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(
                          color: Colors.white70), //titulo del textfield
                      prefixIcon:
                          Icon(Icons.text_fields, color: Colors.white70),
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
                  
                      
                        child:  ElevatedButton(
                          onPressed: () {
                          print('enviando...');
                          registroUsuario();
                          },
                          child: const Text(
                            "Registrate aquí!",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white),
                          
                        ),)
                      )),
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
