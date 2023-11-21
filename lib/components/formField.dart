// ignore: file_names
import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final List<String> dropdownItems;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const MyFormField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.dropdownItems,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            value: selectedValue,
            onChanged: onChanged,
            items: dropdownItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: hintText,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10), // Add spacing between dropdown and text field


          TextField(
            obscureText: obscureText,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: true,
              hintText: 'Additional Notes', // You can customize this hintText
            ),
          ),
        ],
      ),
    );
  }
}
