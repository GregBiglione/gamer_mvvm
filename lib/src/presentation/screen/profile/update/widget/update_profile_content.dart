import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/widget/default_textfield.dart';
import '../../../../widget/default_button.dart';

class UpdateProfileContent extends StatefulWidget {
  final UpdateProfileViewModel updateProfileViewModel;
  final UserData userData;

  const UpdateProfileContent({super.key, required this.updateProfileViewModel,
    required this.userData});

  @override
  State<UpdateProfileContent> createState() => _UpdateProfileContentState();
}

class _UpdateProfileContentState extends State<UpdateProfileContent> {

  @override
  void initState() {
    widget.updateProfileViewModel.loadData(widget.userData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Background image --------------------------------------------------
          Stack(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Image.asset(
                  "assets/images/super_nintendo.jpg",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black38,
                ),
              ),
              Column(
                children: [
                  // Title -----------------------------------------------------
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 130,
                    ),
                    child: const Text(
                      "Bienvenido",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Profile image ---------------------------------------------
                  GestureDetector(
                    onTap: () {
                      widget.updateProfileViewModel.pickImage();
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: widget.updateProfileViewModel.imageFile != null
                          ? FileImage(widget.updateProfileViewModel.imageFile!)
                          : const AssetImage("assets/images/user_menu.png") as ImageProvider,
                    ),
                  ),
                ],
              ),
              // Back button ---------------------------------------------------
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
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          // Edit username -----------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 60,
              top: 40,
              right: 60,
            ),
            child: DefaultTextField(
              initialValue: widget.updateProfileViewModel.updateProfileState.username.value,
              error: widget.updateProfileViewModel.updateProfileState.username.error,
              label: "Nombre de usuario",
              iconData: Icons.person_2_outlined,
              onChanged: (value) {
                widget.updateProfileViewModel.changeUsername(value);
              },
            ),
          ),
          // Edit information button -------------------------------------------
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 60,
            ),
            child: DefaultButton(
              text: "Actualizar información",
              onPressed: () {
                widget.updateProfileViewModel.updateWithoutImage();
              },
              iconData: Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
