import 'package:app_login/design_system/atoms/logo.dart';
import 'package:app_login/design_system/atoms/welcome.dart';
import 'package:flutter/material.dart';

// class LoginTemplate extends StatelessWidget {
//   final Widget form;

//   const LoginTemplate({required this.form});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [Logo(), WelcomeText(), SizedBox(height: 32), form],
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginTemplate extends StatelessWidget {
  final Widget form;

  const LoginTemplate({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // permite que el teclado ajuste la UI
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Logo(),
                    const SizedBox(height: 24),
                    const WelcomeText(),
                    const SizedBox(height: 32),
                    form,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
