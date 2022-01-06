import 'package:flutter/material.dart';
import 'package:temp_app/core/extension/context_extension.dart';

class LetterContainer extends StatelessWidget {
  const LetterContainer({
    Key? key,
    required this.title,
    required this.voidCallback,
  }) : super(key: key);

  final String title;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: voidCallback,
          child: Container(
            width: context.dynamicWidth(0.3),
            height: context.dynamicWidth(0.3),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: FittedBox(
              child: Center(
                child: Text(title.characters.first,
                    style: TextStyle(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
