import 'package:flutter/material.dart';
import 'package:owner_project_app/Widgets/ReusableWidgets/Global/body_text.dart';

class PinLockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
                      const Icon(Icons.lock),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const BodyText(text: "Enter Your Password"),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Row(
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
                    ElevatedButton(onPressed: () {}, child: const Text("1")),
                    const SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: const Text("2")),
                    const SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: const Text("3")),
                  ],
                ),
                const SizedBox(height: 10), // Add space between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text("4")),
                    const SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: const Text("5")),
                    const SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: const Text("6")),
                  ],
                ),
                const SizedBox(height: 10), // Add space between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text("7")),
                    const SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: const Text("8")),
                    const SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(onPressed: () {}, child: const Text("9")),
                  ],
                ),
                const SizedBox(height: 10), // Add space between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text("0")),
                    const SizedBox(width: 10), // Add space between buttons
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.arrow_back)),
                  ],
                ),
                const SizedBox(height: 50), // Add space between rows
                GestureDetector(
                  onTap: () {
                    // Handle tap event
                    // e.g., show a dialog, navigate to another screen, etc.
                    print("Contact the programmer tapped");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
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
