import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/detail/post_detail_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/detail/widget/post_detail_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostDetailViewModel viewModel = Provider.of<PostDetailViewModel>(context);
    Post post = ModalRoute.of(context)?.settings.arguments as Post;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: PostDetailContent(
          viewModel: viewModel,
          post: post,
      ),
    );
  }
}
