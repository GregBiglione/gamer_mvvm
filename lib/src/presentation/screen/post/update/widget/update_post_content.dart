import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/update/update_post_viewmodel.dart';
import '../../../../../domain/model/post.dart';
import '../../../../utils/base_color.dart';
import '../../../../utils/show_select_image_dialog.dart';
import '../../../../widget/default_button.dart';
import '../../../../widget/default_textfield.dart';
import '../../create/widget/post_category.dart';

class UpdatePostContent extends StatelessWidget {
  final UpdatePostViewModel viewModel;
  final Post post;

  const UpdatePostContent(
      {super.key, required this.viewModel, required this.post});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper part with wave ----------------------------------------------
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              color: baseColor,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showSelectImageDialog(
                        context,
                        () => viewModel.takePhoto(),
                        () => viewModel.pickImage(),
                      );
                    },
                    child: viewModel.imageFile != null
                        ? Image.file(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.35,
                            viewModel.imageFile!,
                            fit: BoxFit.cover,
                          )
                        : viewModel.state.image.isNotEmpty
                            ? Image.network(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                viewModel.state.image,
                                fit: BoxFit.cover,
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/gallery.png",
                                    width: 150,
                                    height: 100,
                                  ),
                                  const Text(
                                    "SELECCIONA UNA IMAGEN",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 5,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Game name ---------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: DefaultTextField(
              //controller: viewModel.nameController,
              initialValue: post.name,
              label: "Nombre del juego",
              iconData: Icons.control_camera,
              onChanged: (value) {
                viewModel.changeName(value);
              },
              error: viewModel.state.name.error,
            ),
          ),
          // Description -------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: DefaultTextField(
              //controller: viewModel.descriptionController,
              initialValue: post.description,
              label: "Descripción",
              iconData: Icons.description,
              onChanged: (value) {
                viewModel.changeDescription(value);
              },
              error: viewModel.state.description.error,
            ),
          ),
          // Categories title --------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 15,
            ),
            child: const Text(
              "CATEGORIAS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Categories --------------------------------------------------------
          PostCategory(
            value: "PC",
            groupValue: viewModel.state.category,
            onChanged: (value) {
              viewModel.changeCategory(value);
            },
            image: "assets/images/icon_pc.png",
          ),
          PostCategory(
            value: "XBOX",
            groupValue: viewModel.state.category,
            onChanged: (value) {
              viewModel.changeCategory(value);
            },
            image: "assets/images/icon_xbox.png",
          ),
          PostCategory(
            value: "PLAYSTATION",
            groupValue: viewModel.state.category,
            onChanged: (value) {
              viewModel.changeCategory(value);
            },
            image: "assets/images/icon_ps4.png",
          ),
          PostCategory(
            value: "NINTENDO",
            groupValue: viewModel.state.category,
            onChanged: (value) {
              viewModel.changeCategory(value);
            },
            image: "assets/images/icon_nintendo.png",
          ),
          // Form error --------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 10,
              right: 20,
            ),
            child: Text(
              viewModel.state.error,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          ),
          // Create post button ------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
            ),
            child: DefaultButton(
              text: "ACTUALIZAR POST",
              onPressed: () {
                viewModel.updatePost();
                //print("Image: ${viewModel.imageFile}\nName: ${viewModel.state.name.value}\nDescription: ${viewModel.state.description.value}\nCategory: ${viewModel.state.category}\nUserId: ${viewModel.state.userId}\n");
              },
            ),
          ),
        ],
      ),
    );
  }
}
