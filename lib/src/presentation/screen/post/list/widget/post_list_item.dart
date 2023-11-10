import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';

import '../post_list_viewmodel.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final PostListViewModel viewModel;

  const PostListItem({super.key, required this.post, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "post/detail",
          arguments: post,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 15,
          bottom: 5,
        ),
        child: Card(
          color: const Color.fromARGB(255, 58, 58, 58),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image ---------------------------------------------------------
              Image(
                image: NetworkImage(
                  post.image,
                ),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title ---------------------------------------------------------
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
                      // Description ---------------------------------------------------
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          post.description,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  // Like icon -------------------------------------------------
                  const Spacer(),
                  post.likes.contains(viewModel.id)
                      ? GestureDetector(
                          onTap: () {
                            viewModel.unlike(post.id);
                          },
                          child: Image.asset(
                            "assets/images/like.png",
                            width: 30,
                            height: 30,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            viewModel.like(post.id);
                          },
                          child: Image.asset(
                            "assets/images/like_outline.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                  // Like text -------------------------------------------------
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 15,
                    ),
                    child: Text(
                      post.likes.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  //assets/images/like.png
                  //    - assets/images/like_outline.png
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
