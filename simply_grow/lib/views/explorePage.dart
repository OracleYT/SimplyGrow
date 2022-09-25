// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:simply_grow/app_theme.dart';
import 'package:simply_grow/constant.dart';

import '../controllers/navigationController.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigationController =
        Get.put(NavigationController(), permanent: true);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: const SizedBox(
            width: 58,
            height: 58,
            child:
                Icon(Icons.menu_rounded, color: Color.fromRGBO(24, 30, 48, 1)),
          ),
          onTap: () {
            navigationController.advancedDrawerController.showDrawer();
          },
        ),
        leadingWidth: 65,
        actions: [
          GestureDetector(
            onTap: () {
              // navigateToProfilePage();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 24),
              child: CircleAvatar(
                radius: 38,
                backgroundImage: AssetImage("images/boy1.png"),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            homePageGridLayout(context),
            // Custom App Bar
            // getAppBarUI(context, ref),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child:
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: <Widget>[
          Expanded(
        // width: MediaQuery.of(context).size.width * 0.75,
        // height: 64,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              color: HexColorNew('#F8FAFB'),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(13.0),
                bottomLeft: Radius.circular(13.0),
                topLeft: Radius.circular(13.0),
                topRight: Radius.circular(13.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Utils.themeColor,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Search for course',
                        border: InputBorder.none,
                        helperStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: HexColorNew('#B9BABC'),
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.2,
                          color: HexColorNew('#B9BABC'),
                        ),
                      ),
                      onEditingComplete: () {},
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Icon(Icons.search, color: HexColorNew('#B9BABC')),
                )
              ],
            ),
          ),
        ),
      ),
      // const Expanded(
      //   child: SizedBox(),
      // )
      //   ],
      // ),
    );
  }

  Widget homePageGridLayout(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        getSearchBarUI(),
        // Under Intro
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: SizedBox(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Hello Amogh 👋',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 0.2,
                    color: Color(0xFF3A5160),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Text(
                    "How are you Feeling today...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: Color(0xFF17262A),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widget getAppBarUI(context) {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //         top: 0,
  //         left: 8,
  //         right: 24),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         GestureDetector(
  //               child: SizedBox(
  //                 width: (SizeConfig.box60),
  //                 height: (SizeConfig.box60),
  //                 child: Icon(Icons.menu_rounded,
  //                     color: const Color.fromRGBO(24, 30, 48, 1)),
  //               ),
  //               onTap: () {
  //                 ref.read(drawerControllerProvider).showDrawer();
  //               },
  //             ),
  //         Row(
  //           children: [
  //             // SizedBox(
  //             //   width: (SizeConfig.hp * 7.5),
  //             //   height: (SizeConfig.hp * 7.5),
  //             //   child: Icon(Icons.notifications_none_rounded,
  //             //       color: const Color.fromRGBO(24, 30, 48, 1)),
  //             // ),
  //             // SizedBox(
  //             //   width: 4,
  //             // ),
  //             GestureDetector(
  //               onTap: () {
  //                 navigateToProfilePage();
  //               },
  //               child: CircleAvatar(
  //                 radius: (SizeConfig.avatarRadius),
  //                 backgroundImage: CachedNetworkImageProvider(
  //                   profile,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}
