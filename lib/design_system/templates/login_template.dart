import 'package:flutter/material.dart';

class LoginTemplate extends StatelessWidget {
  final Widget form;

  const LoginTemplate({required this.form});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: form));
  }
}
