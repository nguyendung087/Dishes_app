import 'package:btl_recipes/components/bottom_navbar.dart';
import 'package:btl_recipes/pages/home_screen.dart';
import 'package:btl_recipes/pages/recipe_category.dart';
import 'package:btl_recipes/pages/saved_recipes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut);
          setState(() {
            currentIndex = index;
          });
        },
        SelectedItem: currentIndex,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          RecipeCategory(),
          // SearchScreen(),
          SavedRecipes(),
          Center(
            child: Text('Page 5'),
          ),
        ],
      ),
    );
  }
}
