import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/list/post_list_viewmodel.dart';

class PostListUserInfo extends StatelessWidget {
  final PostListViewModel viewModel;
  final String userId;

  const PostListUserInfo({super.key, required this.viewModel,
    required this.userId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.getUserInfo(userId),
        builder: (context, snapshot){
          final data = snapshot.data;

          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              data?.username ?? "",
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 166, 166, 166),
              ),
            ),
          );
        },
    );
  }
}
