import 'package:app_login/design_system/organisms/login_form.dart';
import 'package:app_login/design_system/templates/login_template.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginTemplate(form: LoginForm());
  }
}
