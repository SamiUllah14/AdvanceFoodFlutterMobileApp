import 'package:flutter/material.dart';

class RoleTextAndButton extends StatelessWidget {
  final String text;
  final String text2;

  final VoidCallback onPressed; // Callback for button press

  const RoleTextAndButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text2,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20, // Adjusted to match textSize
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ],
    );
  }
}