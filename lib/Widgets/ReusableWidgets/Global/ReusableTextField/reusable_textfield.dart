import 'package:flutter/material.dart';
import '../body_text.dart';

class ReusableTextField extends StatelessWidget {
  final String labelText; // Label text for the text field
  final String hintText; // Hint text displayed inside the text field
  final TextEditingController controller; // Controller to manage text input
  final bool isObscureText; // Whether the text field should obscure input
  final TextInputType keyboardType; // Type of keyboard for the field (e.g., email, phone)
  final Function(String)? onChanged; // Callback for text changes
  final IconButton? suffixIcon; // Optional icon button
  final IconData icon; // Icon to display
  final String? Function(String?)? validator; // Validator function

  const ReusableTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.suffixIcon, // Optional icon button
    this.icon = Icons.visibility, // Default icon (can be overridden)
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align start to match Column content
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: BodyText(text: labelText),
        ),
        SizedBox(height: 8), // Adjusted size for better spacing
        Container(
          height: 50, // Fixed height for consistency (adjust if needed)
          width: double.infinity, // Occupies full width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
            color: Colors.grey[200], // Set the background color
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove borders
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12), // Padding
                    hintText: hintText, // Placeholder text
                    suffixIcon: suffixIcon, // Add suffix icon if provided
                  ),
                  controller: controller,
                  obscureText: isObscureText, // Optionally hide text
                  keyboardType: keyboardType, // Set keyboard type
                  onChanged: onChanged, // Handle text changes
                  validator: validator, // Validate the input
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
