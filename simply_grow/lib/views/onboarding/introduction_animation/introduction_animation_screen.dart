import 'package:simply_grow/views/onboarding/introduction_animation/components/certificate_view.dart';
import 'package:simply_grow/views/onboarding/introduction_animation/components/center_next_button.dart';
import 'package:simply_grow/views/onboarding/introduction_animation/components/IITgrads_view.dart';
import 'package:simply_grow/views/onboarding/introduction_animation/components/coding_view.dart';
import 'package:simply_grow/views/onboarding/introduction_animation/components/welcome_view.dart';
import 'package:simply_grow/views/onboarding/introduction_animation/components/top_back_skip_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../Homepage.dart';
import '../../home/navigationWrapper.dart';
// import '../landingPage.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Colors.white, //Color(0xffF7EBE1),
      body: ClipRect(
        child: Stack(
          children: [
            WelcomeView(
              animationController: _animationController,
            ),
            CodingView(
              animationController: _animationController,
            ),
            CertificateView(
              animationController: _animationController,
            ),
            GradsView(
              animationController: _animationController,
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController,
            ),
            CenterNextButton(
              animationController: _animationController,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.6,
        duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController.value >= 0 && _animationController.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController.value > 0.2 &&
        _animationController.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController.value > 0.4 &&
        _animationController.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController.value > 0.6 &&
        _animationController.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController.value > 0.8 &&
        _animationController.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController.value >= 0 && _animationController.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController.value > 0.2 &&
        _animationController.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController.value > 0.4 &&
        _animationController.value <= 0.6) {
      // _animationController?.animateTo(0.8);
      _endClick();
    } else if (_animationController.value > 0.6 &&
        _animationController.value <= 0.8) {}
  }

  void _endClick() {
    Get.offAll(() => NavigationWrapper());
    // arguments: {
    //   "categoryId": authService.userData
    //           .value.categoryId ??
    //       "[-1]"
    // });
  }
}
