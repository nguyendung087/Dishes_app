import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final int SelectedItem;
  final Function(int) onTap;
  const BottomNavBar(
      {super.key, required this.SelectedItem, required this.onTap});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .015, vertical: h * .01),
        child: GNav(
          gap: 10,
          tabBorderRadius: 100,
          backgroundColor: Colors.grey[100]!,
          activeColor: Colors.white,
          color: Colors.blue[600],
          tabBackgroundGradient: LinearGradient(
              colors: [Colors.blue[400]!, Colors.blueAccent.shade700],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
          iconSize: 30,
          textSize: 18,
          padding: EdgeInsets.symmetric(horizontal: w * .01, vertical: h * .01),
          tabs: const [
            GButton(
              icon: CupertinoIcons.home,
              text: 'Trang chủ',
            ),
            GButton(icon: Icons.category, text: 'Loại món'),
            // GButton(icon: CupertinoIcons.search, text: 'Tìm kiếm'),
            GButton(icon: CupertinoIcons.bookmark_solid, text: 'Yêu thích'),
            GButton(icon: CupertinoIcons.shopping_cart, text: 'Mua hàng')
          ],
          onTabChange: widget.onTap,
          selectedIndex: 0,
        ),
      ),
    );
  }
}
