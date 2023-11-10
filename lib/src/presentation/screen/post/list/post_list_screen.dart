import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/list/post_list_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/list/widget/post_list_item.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostListViewModel viewModel = Provider.of<PostListViewModel>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: StreamBuilder(
        stream: viewModel.getAllPost(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(!snapshot.hasData) {
            return const Center(
              child: Text(
                "No hay información",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }

          final response = snapshot.data;
          if(response is Error) {
            final data = response as Error;

            return Center(
              child: Text(
                "Error: ${data.error}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }

          final postList = response as Success<List<Post>>;
          return ListView.builder(
            itemCount: postList.data.length,
            itemBuilder: (context, index) {
              return PostListItem(
                post: postList.data[index],
                viewModel: viewModel,
              );
            },
          );
        },
      ),
    );
  }
}
