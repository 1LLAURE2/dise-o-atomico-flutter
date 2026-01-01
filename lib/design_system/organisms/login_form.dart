import 'package:app_login/design_system/atoms/primary_button.dart';
import 'package:app_login/design_system/molecules/labeled_input.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledInput(label: 'Email'),
        LabeledInput(label: 'Password'),
        PrimaryButton(text: 'Login', onPressed: () {}),
      ],
    );
  }
}
