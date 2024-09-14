import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double fontSize; // Adjust this based on your needs
  final Color color;

  const HeaderText({
    Key? key,
    required this.text, // Correct parameter passing
    this.fontSize = 24.0, // Default font size
    this.color = Colors.blue, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize, // Use the provided font size
        color: color,
      ),
    );
  }
}
