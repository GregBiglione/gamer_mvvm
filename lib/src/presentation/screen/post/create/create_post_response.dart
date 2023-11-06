import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/create_post_viewmodel.dart';

import '../../../../domain/utils/resource.dart';
import '../../../utils/show_dialog.dart';

class CreatePostResponse {
  CreatePostViewModel createPostViewModel;
  BuildContext context;

  CreatePostResponse(this.createPostViewModel, this.context) {
    if(createPostViewModel.response is Loading) {
      buildShowDialog(context);
    }
    else if(createPostViewModel.response is Error) {
      final data = createPostViewModel.response as Error;

      Navigator.pop(context, true);
      Fluttertoast.showToast(
        msg: "Error: ${data.error.toString()}",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      createPostViewModel.resetResponse();
    }
    else if(createPostViewModel.response is Success) {
      final success = createPostViewModel.response as Success<String>;

      Navigator.pop(context, true);
      Fluttertoast.showToast(
        msg: success.data,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      createPostViewModel.resetResponse();
      createPostViewModel.resetState();
    }
  }
}