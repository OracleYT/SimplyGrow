import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:simply_grow/ShortCard/ShortCard.dart';

class ReelScreen extends StatelessWidget {
  const ReelScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F4EF),
        child: PageView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,

          // dragStartBehavior: DragStartBehavior.start,
          itemBuilder: (context, index) => DetailsScreen(),
        ),
      ),
    );
  }
}
