import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Image.asset(
    //       'assets/images/logo.png', // tu logo
    //       height: 80,
    //     ),
    //     const SizedBox(height: 16),
    //   ],
    // );

    return Image.asset(
      'assets/images/logo.png',
      width: 120,
      height: 120,
      fit: BoxFit.contain,
    );
  }
}
