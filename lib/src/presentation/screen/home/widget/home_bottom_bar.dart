import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/home_viewmodel.dart';

class HomeBottomBar extends StatelessWidget {
  final HomeViewModel homeViewModel;
  final BuildContext context;

  const HomeBottomBar({super.key, required this.homeViewModel, required this.context});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: homeViewModel.currentIndex,
      onTap: (index) {
        homeViewModel.currentIndex = index;
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
              Icons.list,
          ),
          label: "Posts"
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
            ),
            label: "My Posts"
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile"
        ),
      ],
    );
  }
}
