import 'package:flutter/material.dart';

class LoginRegisterButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // Function to be called on button press
  final Color backgroundColor; // Color for the button background
  final Color textColor; // Color for the button text
  final double fontSize; // Font size for the button text

  const LoginRegisterButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue, // Default blue color
    this.textColor = Colors.white, // Default white color
    this.fontSize = 16.0, // Default font size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            height: MediaQuery.of(context).size.height >
                    MediaQuery.of(context).size.width
                ? MediaQuery.of(context).size.height * 0.05
                : MediaQuery.of(context).size.width * 0.07,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
