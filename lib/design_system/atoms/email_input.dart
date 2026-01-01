import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController? controller;

  const EmailInput({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: 'Email address'),
    );
  }
}
