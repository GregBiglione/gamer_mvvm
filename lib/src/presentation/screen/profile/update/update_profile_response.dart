import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_viewmodel.dart';

import '../../../utils/show_dialog.dart';

class UpdateProfileResponse {
  UpdateProfileViewModel updateProfileViewModel;
  BuildContext context;

  UpdateProfileResponse(this.updateProfileViewModel, this.context) {
    if(updateProfileViewModel.response is Loading) {
      buildShowDialog(context);
    }
    else if (updateProfileViewModel.response is Error){
      final data = updateProfileViewModel.response as Error;

      Navigator.pop(context, true);
      Fluttertoast.showToast(
        msg: "Error: ${data.error.toString()}",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      updateProfileViewModel.resetResponse();
    }
    else if (updateProfileViewModel.response is Success) {
      //updateProfileViewModel.resetResponse();
      final success = updateProfileViewModel.response as Success<String>;

      Navigator.pop(context, true);
      Fluttertoast.showToast(
        msg: success.data,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      updateProfileViewModel.resetResponse();
    }
  }
}