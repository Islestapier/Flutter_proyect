import 'package:flutter/material.dart';
import 'package:proyect_actual/pages/login.dart';
import 'pages/register.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => RegisterPage(),
        "login/": (BuildContext context) => const LoginPage(),
      },
    );
  }
}
