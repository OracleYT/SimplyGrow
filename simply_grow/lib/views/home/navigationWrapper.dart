import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:simply_grow/constant.dart';
import 'package:simply_grow/controllers/navigationController.dart';
// import 'package:simply_grow/views/home/Homepage/homepage.dart';
// import 'package:simply_grow/views/home/profile/profilePage.dart';
// import 'package:simply_grow/views/home/shop/shopPage.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simply_grow/views/explorePage.dart';
import 'package:simply_grow/views/homePage.dart';

import '../../Card/cards.dart';
import '../../app_theme.dart';

class NavigationWrapper extends StatelessWidget {
  final navigationController = Get.put(NavigationController(), permanent: true);
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    _pageController =
        PageController(initialPage: navigationController.currentIndex.value);

    return GetX<NavigationController>(
        builder: (navigationController) => AdvancedDrawer(
              backdropColor: Utils.themeColor,
              drawer: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, right: 16, top: 44),
                      // padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x003124A1),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color.fromARGB(8, 23, 23, 23),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(80),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color.fromRGBO(57, 75, 123, 0.9),
                              width: 1.8,
                            ),
                          ),
                          alignment: const AlignmentDirectional(-0.0, 0),
                          child: const Icon(
                            Icons.chevron_left_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        onTap: () {
                          navigationController.advancedDrawerController
                              .hideDrawer();
                          // refference!.read(drawerControllerProvider).hideDrawer();
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding:
                            const EdgeInsets.only(left: 36, top: 0, bottom: 24),
                        children: <Widget>[
                          // CircleAvatar(
                          //   radius: 24,
                          //   backgroundImage: CachedNetworkImageProvider(
                          //     profile,
                          //   ),
                          // ),
                          // Padding(
                          // padding: const EdgeInsets.only(left: 8.0),
                          // child:
                          // CircleAvatar(

                          GestureDetector(
                            onTap: () {
                              // mainDrawerViewModel.navigateToProfilePage();
                            },
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                radius: 54,
                                backgroundImage: AssetImage(
                                  "images/boy1.png",
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 36.0, bottom: 16),
                            child: Text(
                              "Amogh Vaishnav",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                letterSpacing: 0.27,
                                color: Color.fromARGB(255, 205, 209, 223),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   child: MainDrawer(
                    //     context: context,
                    //   ),
                    // )
                  ],
                ),
              ),
              controller: navigationController.advancedDrawerController,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 500),
              animateChildDecoration: true,
              rtlOpening: false,
              openScale: 0.85,
              openRatio: 0.7,
              // disabledGestures: true,
              childDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),

              child: Scaffold(
                backgroundColor: Colors.white,
                body: SizedBox.expand(
                  child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        navigationController.onPageChange(index);
                      },
                      children: const <Widget>[
                        MyHomePage(
                          title: "Hola",
                        ),
                        ExplorePage(
                          title: "Hola",
                        ),
                        MaterialApp(
                          home: Scaffold(
                            // backgroundColor: Colors.red,
                            // appBar: AppBar(
                            //   title: Text('Dicee'),
                            //   backgroundColor: Colors.red,
                            // ),
                            body: CardView(),
                          ),
                        ),
                      ]),
                ),
                bottomNavigationBar: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                  child: GNav(
                    gap: 16,
                    // backgroundColor: Colors.white,
                    activeColor: Colors.white.withOpacity(0.95),
                    iconSize: 21,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 18),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Utils.themeColor, //Colors.grey[100]!,
                    color: HexColorNew('#9DA0AA'),
                    // curve: Curves.slowMiddle,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    tabs: const [
                      GButton(
                        icon: FontAwesomeIcons.home,
                        text: 'Home',
                        // textStyle: TextStyle(
                        //     fontSize: SizeConfig.fontSizeM - 4,
                        //     color: Colors.white),
                      ),
                      GButton(
                        icon: FontAwesomeIcons.earthAsia,
                        text: 'Explore',
                      ),
                      // GButton(
                      //   icon: Icons.search,
                      //   text: 'Search',
                      // ),

                      GButton(
                        icon: FontAwesomeIcons.bookBookmark,
                        text: 'Revision',
                      ),
                    ],
                    selectedIndex: navigationController.currentIndex.value,
                    onTabChange: (index) {
                      navigationController.onPageChange(index);
                      _pageController.jumpToPage(index);
                    },
                  ),
                ),
              ),
            ));
  }
}
