import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/utils/show_dialog.dart';

class LoginResponse {
  LoginViewModel loginViewModel;
  BuildContext context;

  LoginResponse(this.loginViewModel, this.context) {
    if (loginViewModel.response is Loading){
      buildShowDialog(context);
    }
    else if (loginViewModel.response is Error){
      final data = loginViewModel.response as Error;

      Navigator.pop(context, true);
      Fluttertoast.showToast(
        msg: "Error: ${data.error.toString()}",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      loginViewModel.resetResponse();
    }
    else if (loginViewModel.response is Success) {
      loginViewModel.resetResponse();
      Navigator.pushNamedAndRemoveUntil(
        context, "home", (route) => false,
      );
    }
  }
}