import 'package:app_login/design_system/atoms/email_input.dart';
import 'package:app_login/design_system/atoms/forgot_password_link.dart';
import 'package:app_login/design_system/atoms/password_input.dart';
import 'package:app_login/design_system/atoms/primary_button.dart';
// import 'package:app_login/design_system/molecules/labeled_input.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EmailInput(),
        const SizedBox(height: 16),
        const PasswordInput(),
        const SizedBox(height: 8),
        ForgotPasswordLink(
          onTap: () {
            // navegación o acción
          },
        ),
        const SizedBox(height: 24),
        PrimaryButton(text: 'Continue', onPressed: () {}),
      ],
    );
  }
}
