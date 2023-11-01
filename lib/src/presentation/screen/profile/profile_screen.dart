import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/profile_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/widet/profile_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileViewModel viewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ProfileContent(),
    );
  }
}
