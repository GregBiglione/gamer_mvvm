import 'package:flutter/material.dart';

showSelectImageDialog(
    BuildContext context, Function() takePhoto, Function() pickImage) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text("Selecciona una opcion"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Camera ----------------------------------------------------------
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                takePhoto();
              },
              icon: Icon(
                Icons.camera_alt_rounded,
                color: Colors.grey[600],
                size: 50,
              ),
            ),
            // Gallery ---------------------------------------------------------
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                pickImage();
              },
              icon: Icon(
                Icons.image,
                color: Colors.grey[600],
                size: 50,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
