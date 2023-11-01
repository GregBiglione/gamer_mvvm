import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_response.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/widget/update_profile_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateProfileViewModel viewModel = Provider.of<UpdateProfileViewModel>(context);
    UserData userData = ModalRoute.of(context)?.settings.arguments as UserData;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      UpdateProfileResponse(viewModel, context);
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      body: UpdateProfileContent(
        updateProfileViewModel: viewModel,
        userData: userData,
      ),
    );
  }
}
