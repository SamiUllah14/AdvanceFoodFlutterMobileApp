import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PanelContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final void Function() onTap;
  final Color color;
  final double widthFactor;
  final double heightFactor;

  const PanelContainer({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onTap,
    this.color = Colors.blue,
    this.widthFactor = 0.4,
    this.heightFactor = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth * widthFactor,
        height: screenWidth * heightFactor,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                imagePath,
                width: screenWidth *
                    (widthFactor + 0.1), // Slightly larger image width
                height: screenWidth *
                    (heightFactor - 0.19), // Slightly smaller image height
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
