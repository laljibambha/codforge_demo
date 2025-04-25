import 'package:codforge_demo/screens/category/category_screen.dart';
import 'package:codforge_demo/screens/home/home_screen.dart';
import 'package:codforge_demo/screens/like/like_screen.dart';
import 'package:codforge_demo/screens/profile/profile_screen.dart';
import 'package:codforge_demo/screens/receipt/receipt_screen.dart';
import 'package:codforge_demo/utils/app_images/app_images.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    LikeScreen(),
    CategoryScreen(),
    ReceiptScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon({dynamic icon, dynamic activeIcon, required int index}) {
    bool isSelected = _selectedIndex == index;

    if (icon is IconData && activeIcon is IconData) {
      return isSelected
          ? Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 4),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(activeIcon, color: Colors.white),
          )
          : Icon(icon, color: Colors.grey);
    } else if (icon is String && activeIcon is String) {
      return isSelected
          ? Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 4),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              activeIcon,
              width: 24,
              height: 24,
              color: Colors.black,
            ),
          )
          : Image.asset(icon, width: 24, height: 24, color: Colors.grey.shade700);
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(
                icon: LocalImages.icHomeOutlineIcon,
                activeIcon: LocalImages.icHomeIcon,
                index: 0,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                icon: LocalImages.icLikeOutlineIcon,
                activeIcon: LocalImages.icLikeIcon,
                index: 1,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                icon: LocalImages.icCartOutlineIcon,
                activeIcon: LocalImages.icCartIcon,
                index: 2,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                icon: LocalImages.icReceiptOutlineIcon,
                activeIcon: LocalImages.icReceiptIcon,
                index: 3,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                icon: LocalImages.icProfileOutlineIcon,
                activeIcon: LocalImages.icProfileIcon,
                index: 4,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
