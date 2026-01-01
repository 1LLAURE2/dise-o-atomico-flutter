import 'package:flutter/material.dart';

class LabeledInput extends StatelessWidget {
  final String label;

  const LabeledInput({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(label), TextField()],
    );
  }
}
