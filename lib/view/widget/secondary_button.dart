import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.title, required this.voidCallback,
  }) : super(key: key);

  final String title;

  final VoidCallback voidCallback;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: voidCallback,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: Colors.green.shade800,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.pinkAccent),
        ),
      ),
    );
  }
}
