import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart

class CustomCircularGraph extends StatelessWidget {
  final List<double> data;
  final List<Color> colors;
  final List<String> titles;
  final double centerSpaceRadius; // Add this parameter

  const CustomCircularGraph({
    Key? key,
    required this.data,
    required this.colors,
    required this.titles,
    this.centerSpaceRadius = 0, // Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // Calculate responsive values
    final chartHeight = isPortrait ? screenHeight * 0.17 : screenHeight * 0.4;
    final chartWidth = isPortrait ? screenWidth * 0.9 : screenWidth * 0.95;
    final pieRadius = isPortrait ? chartHeight * 0.4 : chartHeight * 0.45;

    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Cancel Order",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Confirmed Order",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ],
        ),
        Container(
          height: chartHeight,
          width: chartWidth,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: PieChart(
              PieChartData(
                sections: List.generate(
                  data.length,
                  (index) {
                    return PieChartSectionData(
                      value: data[index],
                      color: colors[index % colors.length],
                      title: '${data[index].toStringAsFixed(1)}%',
                      radius: pieRadius, // Use responsive radius here
                      titleStyle: const TextStyle(
                        fontSize: 15, // Use responsive font size here
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                centerSpaceRadius: centerSpaceRadius, // Use the parameter here
                sectionsSpace: 2, // Space between sections
              ),
            ),
          ),
        ),
      ],
    );
  }
}
