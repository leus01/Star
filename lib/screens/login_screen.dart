//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key:key);

  @override
  State<LoginScreen>  createState() => _LoginScreenState();
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
                  const TextField(                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
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
                    height: 35,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "homeScreen");
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
                        child: const Center(
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      )),
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
