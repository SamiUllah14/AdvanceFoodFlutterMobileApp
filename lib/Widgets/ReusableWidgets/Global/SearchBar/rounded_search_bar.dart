import 'package:flutter/material.dart';

class RoundedSearchBar extends StatefulWidget {
  final void Function(String) onSearchPressed; // Function to handle search query

  const RoundedSearchBar({Key? key, required this.onSearchPressed}) : super(key: key);

  @override
  _RoundedSearchBarState createState() => _RoundedSearchBarState();
}

class _RoundedSearchBarState extends State<RoundedSearchBar> {
  String searchText = ''; // Store the search text

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchText = value; // Update search text when typing
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    if (searchText.isNotEmpty) {
                      widget.onSearchPressed(searchText); // Pass the search text to the parent
                    }
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.black, // Search button background
                    child: Icon(Icons.search, color: Colors.white), // Search icon
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
