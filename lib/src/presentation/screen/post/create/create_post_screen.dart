import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/create_post_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/widget/create_post_content.dart';
import 'package:provider/provider.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreatePostViewModel viewModel = Provider.of<CreatePostViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: CreatePostContent(
        createPostViewModel: viewModel,
      ),
    );
  }
}
