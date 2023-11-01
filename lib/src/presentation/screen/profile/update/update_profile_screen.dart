import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/widget/update_profile_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: UpdateProfileContent(),
    );
  }
}
