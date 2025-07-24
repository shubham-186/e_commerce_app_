import 'package:e_commerce_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import '../../pages/cart_page.dart';
import '../../pages/category_page.dart';
import '../../pages/favourite_page.dart';
import '../../pages/homepage.dart';
import '../../utlils/constants/app_constants.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [

    CategoryPage(),
    FavouritePage(),
    Homepage(),
    CartPage(),
    ProfilePage(),
  ];

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.grid_view;
      case 1:
        return Icons.favorite_border;
      case 2:
        return Icons.home;
      case 3:
        return Icons.shopping_cart_outlined;
      case 4:
        return Icons.person_outline;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.whiteColor,
      /*appBar: AppBar(
        centerTitle: true,
        backgroundColor: Const.themeColor,
        foregroundColor: Const.whiteColor,
        title: Text("Homepage", style: TextStyle(fontSize: 14)),
      ),*/

      /// ✅ Show selected page
      body: _pages[_selectedIndex],

      /// Bottom Nav
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            bool isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: isSelected ? 6 : 14),
                decoration: BoxDecoration(
                  color: isSelected ? Const.themeColor : Colors.transparent,
                  shape: BoxShape.circle,
                  boxShadow: isSelected
                      ? [
                    BoxShadow(
                      color: Const.themeColor.withOpacity(0.4),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ]
                      : [],
                ),
                child: Icon(
                  _getIconForIndex(index),
                  size: 24,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
