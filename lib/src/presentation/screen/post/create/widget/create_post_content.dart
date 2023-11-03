import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/widget/post_category.dart';
import 'package:gamer_mvvm/src/presentation/widget/default_button.dart';
import 'package:gamer_mvvm/src/presentation/widget/default_textfield.dart';

import '../../../../utils/base_color.dart';

class CreatePostContent extends StatelessWidget {
  const CreatePostContent({super.key});

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/add_image.png",
                        width: 150,
                        height: 100,
                      ),
                      const Text(
                        "SELECCIONA UNA IMAGEN",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ],
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
              label: "Nombre del juego",
              iconData: Icons.control_camera,
              onChanged: (value) {},
            ),
          ),
          // Description -------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: DefaultTextField(
              label: "Descripción",
              iconData: Icons.description,
              onChanged: (value) {},
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
            groupValue: "CATEGORIAS",
            onChanged: (value) {},
            image: "assets/images/icon_pc.png",
          ),
          PostCategory(
            value: "XBOX",
            groupValue: "CATEGORIAS",
            onChanged: (value) {},
            image: "assets/images/icon_xbox.png",
          ),
          PostCategory(
            value: "PLAYSTATION",
            groupValue: "CATEGORIAS",
            onChanged: (value) {},
            image: "assets/images/icon_ps4.png",
          ),
          PostCategory(
            value: "NINTENDO",
            groupValue: "CATEGORIAS",
            onChanged: (value) {},
            image: "assets/images/icon_nintendo.png",
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
