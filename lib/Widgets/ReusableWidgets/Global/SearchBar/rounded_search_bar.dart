import 'package:flutter/material.dart';

class RoundedSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final String hintText;
  final Function()? onSearchIconTap; // Optional search icon tap callback

  const RoundedSearchBar({
    super.key,
    required this.searchController,
    this.hintText = "Search...",
    this.onSearchIconTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RoundedSearchBarState createState() => _RoundedSearchBarState();
}

class _RoundedSearchBarState extends State<RoundedSearchBar> {
  bool _isIconClicked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      height: isPortrait ? size.height * 0.06 : size.height * 0.15,
      width: isPortrait ? size.width * 0.9 : size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TextField for search input
            Expanded(
              child: TextField(
                controller: widget.searchController,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            // InkWell for clickable search icon
            InkWell(
              onTap: () {
                setState(() {
                  _isIconClicked = !_isIconClicked;
                });
                // Call the custom onSearchIconTap if provided
                if (widget.onSearchIconTap != null) {
                  widget.onSearchIconTap!();
                }
              },
              child: Icon(
                Icons.search,
                color:
                    _isIconClicked ? Colors.blue : Colors.black, // Toggle color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
