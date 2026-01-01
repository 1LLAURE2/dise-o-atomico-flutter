import 'package:app_login/design_system/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 238, 68, 46),
        ),
      ),
      home: LoginPage(),
      // home: Scaffold(
      //   body: Center(child: Image.asset('assets/images/logo.png')),
      // ),
    );
  }
}
