import 'package:flutter/material.dart';

class SideTitlesForScreens extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;

  const SideTitlesForScreens({
    super.key,
    required this.title,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle ??
          const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
