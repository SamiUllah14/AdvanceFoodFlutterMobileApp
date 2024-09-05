import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_project_app/Widgets/ReusableWidgets/Global/body_text.dart';

class PinLockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(
                      16.0), // Add some padding inside the Container
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      BodyText(text: "Enter Your Password"),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotsForPassword(),
                    DotsForPassword(),
                    DotsForPassword(),
                    DotsForPassword(),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("1")),
                    SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: Text("2")),
                    SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: Text("3")),
                  ],
                ),
                SizedBox(height: 10), // Add space between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("4")),
                    SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: Text("5")),
                    SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: Text("6")),
                  ],
                ),
                SizedBox(height: 10), // Add space between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("7")),
                    SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: Text("8")),
                    SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: Text("9")),
                  ],
                ),
                SizedBox(height: 10), // Add space between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("0")),
                    SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.arrow_back)),
                  ],
                ),
                SizedBox(height: 50), // Add space between rows
                GestureDetector(
                  onTap: () {
                    // Handle tap event
                    // e.g., show a dialog, navigate to another screen, etc.
                    print("Contact the programmer tapped");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DotsForPassword extends StatelessWidget {
  const DotsForPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      color: Colors.black,
      margin: const EdgeInsets.symmetric(
          horizontal: 4.0), // Optional: Add margin between dots
    );
  }
}
