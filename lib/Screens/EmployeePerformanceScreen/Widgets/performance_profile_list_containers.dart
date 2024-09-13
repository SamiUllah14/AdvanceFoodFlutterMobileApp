import 'package:flutter/material.dart';

class PerformanceProfileListContainers extends StatelessWidget {
  final String headtext;
  final String descriptionText;

  const PerformanceProfileListContainers({
    super.key,
    required this.headtext,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: isPortrait ? screenHeight * 0.08 : screenHeight * 0.2,
        width: isPortrait ? screenWidth * 0.9 : screenWidth * 0.95,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20), // Adjust the radius as needed
          color: Colors.grey[200], // Set the background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the start
            children: [
              Text(
                headtext,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                descriptionText,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              // ignore: prefer_const_constructors
            ],
          ),
        ),
      ),
    );
  }
}
