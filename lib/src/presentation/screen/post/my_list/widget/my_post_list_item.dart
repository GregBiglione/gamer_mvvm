import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';

class MyPostListItem extends StatelessWidget {
  final Post post;

  const MyPostListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
        bottom: 5,
      ),
      child: Card(
        color: const Color.fromARGB(255, 58, 58, 58),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image ---------------------------------------------------------------
            Image(
              image: NetworkImage(
                post.image,
              ),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            // Title ---------------------------------------------------------------
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                  vertical: 10,
              ),
              child: Text(
                post.name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Description ---------------------------------------------------------
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                post.description,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
