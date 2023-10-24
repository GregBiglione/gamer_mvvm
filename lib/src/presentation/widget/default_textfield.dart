import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function(String text) onChanged;

  const DefaultTextField({super.key, required this.label,
    required this.iconData, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
        label: Text(
          label,
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        suffixIcon: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
      style: const TextStyle(
          color: Colors.white
      ),
    );
  }
}