import 'package:simply_grow/constant.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Vx.gray100,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(Utils.buttonColor),
        ),
      ),
    );
  }
}
