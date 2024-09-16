import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  final String textName;
  final String textBranchName;
  final IconData profileIcon;
  final VoidCallback deleteIcon;
  final VoidCallback editIcon;

  const ProfileList({
    super.key,
    required this.textName,
    required this.textBranchName,
    required this.profileIcon,
    required this.deleteIcon,
    required this.editIcon,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(profileIcon, size: 32), // Use the provided profileIcon
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the start
              children: [
                Text(
                  textName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  textBranchName,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                SizedBox(width: 5),
              ],
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
                  onPressed: editIcon, // Use the provided editIcon callback
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                  onPressed: deleteIcon, // Use the provided deleteIcon callback
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
