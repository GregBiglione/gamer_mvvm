import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';

class PostUserDetailInfo extends StatelessWidget {
  final UserData userData;

  const PostUserDetailInfo({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: userData.image.isNotEmpty
                ? NetworkImage(userData.image)
                : const AssetImage(
                "assets/images/user_menu.png"
            ) as ImageProvider,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userData.username,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                userData.email,
                style: const TextStyle(
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
