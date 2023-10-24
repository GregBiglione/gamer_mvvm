import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String label;
  final IconData iconData;

  const DefaultTextField({super.key, required this.label,
    required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextField(
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