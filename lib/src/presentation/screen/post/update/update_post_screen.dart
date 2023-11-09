import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/update/update_post_response.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/update/update_post_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/update/widget/update_post_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class UpdatePostScreen extends StatelessWidget {
  const UpdatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UpdatePostViewModel viewModel = Provider.of<UpdatePostViewModel>(context);
    Post post = ModalRoute.of(context)?.settings.arguments as Post;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder(
        future: viewModel.loadData(post),
        builder: (context, _) => UpdatePostContent(
          viewModel: viewModel,
          post: post,
        )
      ),
    );
  }
}
