import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/info/profile_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/info/widet/profile_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileViewModel viewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: StreamBuilder(
        stream: viewModel.getUserById(),
        builder: (context, snapshot) {
          final response = snapshot.data;

          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final userData = response as Success<UserData>;
          if(response is Error) {
            final data = response as Error;

            return Center(
              child: Text("Error ${data.error}"),
            );
          }
          return ProfileContent(
            userData: userData.data,
            profileViewModel: viewModel,
          );
        },
      ),
    );
  }
}
