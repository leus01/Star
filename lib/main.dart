import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:star/firebase_options.dart';
import 'package:star/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppRouting.initialRoute,
      debugShowCheckedModeBanner: false,
      routes: AppRouting.getRoutes(),
      theme: ThemeData(
        fontFamily: 'AvenirLTStd',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
      ),
    );
  }
}
