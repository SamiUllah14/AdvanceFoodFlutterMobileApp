import 'package:flutter/material.dart';

class SideTitlesForScreens extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;

  const SideTitlesForScreens({
    Key? key,
    required this.title,
    this.textStyle,
  }) : super(key: key);

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
