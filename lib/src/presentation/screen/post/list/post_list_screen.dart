import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/list/post_list_viewmodel.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostListViewModel viewModel = Provider.of<PostListViewModel>(context);

    return Scaffold(
      body: StreamBuilder(
        stream: viewModel.getAllPost(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final response = snapshot.data;
          if(response is Error) {
            final data = response as Error;

            return Center(
              child: Text("Error: ${data.error}"),
            );
          }

          final success = response as Success<List<Post>>;
          return Center(
            child: Text("Post name: ${success.data}"),
          );
        },
      ),
    );
  }
}
