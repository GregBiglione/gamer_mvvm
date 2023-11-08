import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/my_list/my_post_list_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/my_list/widget/my_post_list_item.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

import '../../../../domain/model/post.dart';
import '../../../../domain/utils/resource.dart';

class MyPostListScreen extends StatelessWidget {
  const MyPostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyPostListViewModel viewModel = Provider.of<MyPostListViewModel>(context);

    return Scaffold(
      body: Scaffold(
        backgroundColor: backgroundColor,
        body: StreamBuilder(
          stream: viewModel.getAllPostById(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(!snapshot.hasData) {
              return const Center(
                child: Text("No hay información"),
              );
            }

            final response = snapshot.data;
            if(response is Error) {
              final data = response as Error;

              return Center(
                child: Text("Error: ${data.error}"),
              );
            }

            final postList = response as Success<List<Post>>;
            return ListView.builder(
              itemCount: postList.data.length,
              itemBuilder: (context, index) {
                return MyPostListItem(
                  post: postList.data[index],
                  viewModel: viewModel,
                );
              },
            );
          },
        ),
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
