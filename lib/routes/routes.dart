import 'package:flutter/material.dart';
import 'package:star/screens/home_screen.dart';
import 'package:star/screens/login_screen.dart';
import 'package:star/screens/movie_screen.dart';
import 'package:star/screens/profile_screen.dart';
import 'package:star/screens/register_screen.dart';

//import 'package:star/screens/screens.dart';

class AppRouting {
  static const initialRoute =
      'loginScreen'; // que pantalla aparecerá cuando encienda el cell

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoute = {};

    appRoute
        .addAll({"loginScreen": (BuildContext context) => const LoginScreen()});
    appRoute
        .addAll({"homeScreen": (BuildContext context) => const HomeScreen()});
    appRoute
        .addAll({"movieScreen": (BuildContext context) => const MovieScreen()});
    appRoute.addAll(
        {"registerScreen": (BuildContext context) => const RegisterScreen()});
    appRoute.addAll(
        {"profileScreen": (BuildContext context) => const ProfileScreen()});

    return appRoute;
  }
}
