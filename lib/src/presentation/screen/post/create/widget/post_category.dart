import 'package:flutter/material.dart';

class PostCategory  extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String value) onChanged;
  final String image;

  const PostCategory ({super.key, required this.value, required this.groupValue,
    required this.onChanged, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        top: 15,
      ),
      child: Row(
        children: [
          Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (value) {
                onChanged;
              }
          ),
          SizedBox(
            width: 130,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 30,
            ),
            child: Image.asset(
              image,
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}