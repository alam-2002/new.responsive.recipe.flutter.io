import 'package:flutter/material.dart';
import 'package:recipe_app_youtube/commons/bottom_nav_bar.dart';
import 'package:recipe_app_youtube/screens/1_home/home_screen.dart';
import 'package:recipe_app_youtube/screens/recipe_category.dart';
import 'package:recipe_app_youtube/screens/saved_screen.dart';
import 'package:recipe_app_youtube/screens/search_screen.dart';
import 'package:recipe_app_youtube/screens/shopping_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          RecipeCategory(),
          SearchScreen(),
          SavedScreen(),
          ShoppingScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
          setState(() {
            currentIndex = index;
          });
        },
        selectedItem: currentIndex,
      ),
    );
  }
}
