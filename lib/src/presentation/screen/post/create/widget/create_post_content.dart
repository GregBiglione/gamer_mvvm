import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/create_post_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/widget/post_category.dart';
import 'package:gamer_mvvm/src/presentation/widget/default_button.dart';
import 'package:gamer_mvvm/src/presentation/widget/default_textfield.dart';

import '../../../../utils/base_color.dart';
import '../../../../utils/show_select_image_dialog.dart';

class CreatePostContent extends StatelessWidget {
  final CreatePostViewModel createPostViewModel;

  const CreatePostContent({super.key, required this.createPostViewModel});

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
                        () => createPostViewModel.takePhoto(),
                        () => createPostViewModel.pickImage(),
                      );
                    },
                    child: createPostViewModel.createPostState.image != null
                        ? Image.file(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.35,
                            createPostViewModel.imageFile!,
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
              controller: createPostViewModel.nameController,
              //initialValue: createPostViewModel.createPostState.name.value,
              label: "Nombre del juego",
              iconData: Icons.control_camera,
              onChanged: (value) {
                createPostViewModel.changeName(value);
              },
              error: createPostViewModel.createPostState.name.error,
            ),
          ),
          // Description -------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: DefaultTextField(
              controller: createPostViewModel.descriptionController,
              //initialValue: createPostViewModel.createPostState.description.value,
              label: "Descripción",
              iconData: Icons.description,
              onChanged: (value) {
                createPostViewModel.changeDescription(value);
              },
              error: createPostViewModel.createPostState.description.error,
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
            groupValue: createPostViewModel.createPostState.category,
            onChanged: (value) {
              createPostViewModel.changeCategory(value);
            },
            image: "assets/images/icon_pc.png",
          ),
          PostCategory(
            value: "XBOX",
            groupValue: createPostViewModel.createPostState.category,
            onChanged: (value) {
              createPostViewModel.changeCategory(value);
            },
            image: "assets/images/icon_xbox.png",
          ),
          PostCategory(
            value: "PLAYSTATION",
            groupValue: createPostViewModel.createPostState.category,
            onChanged: (value) {
              createPostViewModel.changeCategory(value);
            },
            image: "assets/images/icon_ps4.png",
          ),
          PostCategory(
            value: "NINTENDO",
            groupValue: createPostViewModel.createPostState.category,
            onChanged: (value) {
              createPostViewModel.changeCategory(value);
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
              createPostViewModel.createPostState.error,
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
              text: "CREAR POST",
              onPressed: () {
                createPostViewModel.createPost();
                //print("Image: ${createPostViewModel.imageFile}\nName: ${createPostViewModel.createPostState.name.value}\nDescription: ${createPostViewModel.createPostState.description.value}\nCategory: ${createPostViewModel.createPostState.category}\nUserId: ${createPostViewModel.createPostState.userId}\n");
              },
            ),
          ),
        ],
      ),
    );
  }
}
