import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';

class MyPostListScreen extends StatelessWidget {
  const MyPostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("My post list screen"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: baseColor,
        onPressed: () {
          Navigator.pushNamed(context, "post/create");
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
