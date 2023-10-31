import 'package:flutter/material.dart';

import '../utils/base_color.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final IconData iconData;
  final Color color;

  const DefaultButton({super.key, required this.text, required this.onPressed,
    this.iconData = Icons.arrow_forward_ios, this.color = baseColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            height: 50,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 15,
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}