import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/widet/profile_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ProfileContent(),
    );
  }
}
