import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/features/account/screens/account_screen.dart';
import 'package:amazon_clone_flutter/features/home/screens/home_screen.dart';
import 'package:amazon_clone_flutter/widgets/custom_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42.0;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: CustomText(text: "Cart Page"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: updatePage,
        items: [
          // HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 0
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: "Home",
          ),
          // ACCOUNT/PROFILE
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: "Profile",
          ),
          // CART
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: Badge(
                  elevation: 0,
                  badgeContent: const CustomText(text: "2"),
                  badgeColor: Colors.red,
                  child: const Icon(Icons.shopping_cart_outlined)),
            ),
            label: "Cart",
          ),
        ],
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
      ),
    );
  }
}
