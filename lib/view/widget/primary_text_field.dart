import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.isObsecture,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final bool isObsecture;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecture,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
