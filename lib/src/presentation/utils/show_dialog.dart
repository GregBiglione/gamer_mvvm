import 'package:flutter/material.dart';

buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    barrierDismissible: false,
  );
}