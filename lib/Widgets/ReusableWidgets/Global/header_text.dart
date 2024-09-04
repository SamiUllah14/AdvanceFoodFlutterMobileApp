import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double fontSize; // Adjust this based on your needs
  final Color color;

  const ReusableText({
    Key? key,
    required this.text,
    this.fontSize = 0.0, // Default font size
    this.color = Colors.blue, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: TextStyle(
        fontSize: screenWidth * 0.09, // 9% of the screen width

        color: color,
      ),
    );
  }
}
