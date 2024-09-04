import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final Color color;

  const BodyText({
    Key? key,
    required this.text,
    this.color = Colors.black, // Default color for body text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: MediaQuery.of(context).size.width *
            0.035, // 3.5% based on screen width
      ),
    );
  }
}
