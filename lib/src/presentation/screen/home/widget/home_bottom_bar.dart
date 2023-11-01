import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/home_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';

class HomeBottomBar extends StatelessWidget {
  final HomeViewModel homeViewModel;
  final BuildContext context;

  const HomeBottomBar({super.key, required this.homeViewModel, required this.context});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      fixedColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      currentIndex: homeViewModel.currentIndex,
      onTap: (index) {
        homeViewModel.currentIndex = index;
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            color: Colors.white,
          ),
          label: "Posts"
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
              color: Colors.white,
            ),
            label: "My Posts"
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: "Profile"
        ),
      ],
    );
  }
}
