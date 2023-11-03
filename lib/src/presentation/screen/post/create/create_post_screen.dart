import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/widget/create_post_content.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: CreatePostContent(),
    );
  }
}
