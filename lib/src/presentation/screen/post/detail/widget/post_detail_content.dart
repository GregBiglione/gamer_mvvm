import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/detail/post_detail_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/detail/widget/post_user_detail_info.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';

class PostDetailContent extends StatelessWidget {
  final PostDetailViewModel viewModel;
  final Post post;

  const PostDetailContent({super.key, required this.viewModel,
    required this.post});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image -------------------------------------------------------------
          Stack(
            children: [
              Image(
                image: NetworkImage(
                  post.image,
                ),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
              // Back button ---------------------------------------------------
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 5,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ]
          ),
          // Card user information ---------------------------------------------
          FutureBuilder(
            future: viewModel.getUser(post.userId),
            builder: (context, snapshot) {
              if(snapshot.data == null) {
                return Container();
              }
              final data = snapshot.data;

              return // Card user information ----------------------------------
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  height: 90,
                  child: Card(
                    color: const Color.fromARGB(255, 58, 58, 58),
                    child: PostUserDetailInfo(userData: data!),
                  ),
                );
            },
          ),
          // Game name ---------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 25,
              top: 10,
            ),
            child: Text(
              post.name,
              style: const TextStyle(
                color: baseColor,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Console logo ------------------------------------------------------
          Container(
            height: 50,
            margin: const EdgeInsets.only(
              left: 25,
              top: 15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 58, 58, 58),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              children: [
                if(post.category == "PC")... [
                  Image.asset(
                    "assets/images/icon_pc.png",
                  ),
                ]
                else if(post.category == "XBOX")... [
                  Image.asset(
                    "assets/images/icon_xbox.png",
                  ),
                ]
                else if(post.category == "PLAYSTATION")... [
                  Image.asset(
                    "assets/images/icon_ps4.png",
                  ),
                ]
                else if(post.category == "NINTENDO")... [
                  Image.asset(
                    "assets/images/icon_nintendo.png",
                  ),
                ],
                Text(
                  post.category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ),
          // Horizontal line ---------------------------------------------------
          const Divider(
            color: Color.fromARGB(255, 58, 58, 58),
            indent: 30,
            endIndent: 30,
            height: 50,
          ),
          // Description -------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            child: const Text(
              "DESCRIPTION",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 15,
              right: 20,
            ),
            child: Text(
              post.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
