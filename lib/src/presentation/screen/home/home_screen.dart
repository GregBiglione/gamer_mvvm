import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/home_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/widget/home_bottom_bar.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/list/post_list_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/my_list/my_post_list_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/info/profile_screen.dart';
import 'package:gamer_mvvm/src/presentation/widget/default_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    final currentTab = [
      const PostListScreen(),
      const MyPostListScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: currentTab[viewModel.currentIndex],
      bottomNavigationBar: HomeBottomBar(
        homeViewModel: viewModel,
        context: context,
      ),
    );
  }
}
