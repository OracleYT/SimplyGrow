// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controllers/navigationController.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          child: SizedBox(
            width: 58,
            height: 58,
            child: Icon(Icons.menu_rounded,
                color: const Color.fromRGBO(24, 30, 48, 1)),
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
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
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

  Widget homePageGridLayout(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        // Under Intro
        Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: SizedBox(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
