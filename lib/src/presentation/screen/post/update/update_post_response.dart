import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/update/update_post_viewmodel.dart';

import '../../../../domain/utils/resource.dart';
import '../../../utils/show_dialog.dart';

class UpdatePostResponse {
  UpdatePostViewModel viewModel;
  BuildContext context;

  UpdatePostResponse(this.viewModel, this.context) {
    if(viewModel.response is Loading) {
      buildShowDialog(context);
    }
    else if (viewModel.response is Error){
      final data = viewModel.response as Error;

      Navigator.pop(context, true);
      Fluttertoast.showToast(
        msg: "Error: ${data.error.toString()}",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      viewModel.resetResponse();
    }
    else if (viewModel.response is Success) {
      //viewModel.resetResponse();
      final success = viewModel.response as Success<String>;

      Navigator.pop(context, true);
      Fluttertoast.showToast(
        msg: success.data,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      viewModel.resetResponse();
    }
  }
}