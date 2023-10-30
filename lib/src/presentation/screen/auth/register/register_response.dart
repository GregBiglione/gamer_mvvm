import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/utils/show_dialog.dart';

class RegisterResponse {
  RegisterViewModel registerViewModel;
  BuildContext context;

  RegisterResponse(this.registerViewModel, this.context) {
    if (registerViewModel.response is Loading) {
      buildShowDialog(context);
    } else if (registerViewModel.response is Error){
      final data = registerViewModel.response as Error;

      Navigator.pop(context, true);
      Fluttertoast.showToast(
        msg: "Error: ${data.error.toString()}",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      registerViewModel.resetResponse();
    }
    else if (registerViewModel.response is Success) {
      Navigator.pushNamedAndRemoveUntil(
        context, "home", (route) => false,
      );
    }
  }
}