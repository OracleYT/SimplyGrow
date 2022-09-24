import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:simply_grow/constant.dart';
import 'package:simply_grow/controllers/navigationController.dart';
// import 'package:simply_grow/views/home/Homepage/homepage.dart';
// import 'package:simply_grow/views/home/profile/profilePage.dart';
// import 'package:simply_grow/views/home/shop/shopPage.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simply_grow/views/homePage.dart';

import '../../app_theme.dart';

class NavigationWrapper extends StatelessWidget {
  final navigationController = Get.put(NavigationController(), permanent: true);
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    _pageController =
        PageController(initialPage: navigationController.currentIndex.value);

    return GetX<NavigationController>(
        builder: (navigationController) => Scaffold(
              body: SizedBox.expand(
                child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      navigationController.onPageChange(index);
                    },
                    children: const <Widget>[
                      MyHomePage(),
                      MyHomePage(),
                      MyHomePage()
                    ]),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: GNav(
                  gap: 8,
                  activeColor: Colors.white.withOpacity(0.95),
                  iconSize: 8,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.black, //Colors.grey[100]!,
                  color: HexColorNew('#9DA0AA'),
                  // curve: Curves.slowMiddle,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                      // textStyle: TextStyle(
                      //     fontSize: SizeConfig.fontSizeM - 4,
                      //     color: Colors.white),
                    ),
                    GButton(
                      icon: Icons.emoji_events,
                      text: 'Challenges',
                    ),
                    // GButton(
                    //   icon: Icons.search,
                    //   text: 'Search',
                    // ),

                    GButton(
                      icon: Icons.person,
                      text: 'Posts',
                    ),
                  ],
                  selectedIndex: navigationController.currentIndex.value,
                  onTabChange: (index) {
                    navigationController.onPageChange(index);
                    _pageController.jumpToPage(index);
                  },
                ),
              ),
            ));
  }
}
